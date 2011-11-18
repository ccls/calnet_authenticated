#class CalnetAuthenticatedGenerator < Rails::Generator::NamedBase
class CalnetAuthenticatedGenerator < Rails::Generator::Base

	def manifest
		record do |m|
			#	The autotest file will require that the app actually 
			#		looks for autotest files.
			m.directory('config/autotest')
			m.file('autotest_calnet_authenticated.rb', 'config/autotest/calnet_authenticated.rb')

			#	*.rake files in the lib/tasks/ directory are automatically
			#		loaded so nothing is required to include this.
			m.directory('lib/tasks')
			m.file('calnet_authenticated.rake', 'lib/tasks/calnet_authenticated.rake')



#	This is alway for a User, so the requirement of "User" to 
#		the command is a bit unnecessary now.


#	may want to consider installing roles.yml




			m.migration_template 'migration.rb', 'db/migrate', 
				:migration_file_name => "add_calnet_authenticated_columns_to_users"
#				:migration_file_name => "add_calnet_authenticated_columns_to_#{file_path.gsub(/\//, '_').pluralize}"

			dot = File.dirname(__FILE__)

			m.directory('public/javascripts')
			Dir["#{dot}/templates/javascripts/*js"].each{|file| 
				f = file.split('/').slice(-2,2).join('/')
				m.file(f, "public/javascripts/#{File.basename(file)}")
			}
			m.directory('public/stylesheets')
			Dir["#{dot}/templates/stylesheets/*css"].each{|file| 
				f = file.split('/').slice(-2,2).join('/')
				m.file(f, "public/stylesheets/#{File.basename(file)}")
			}



#	Due to the ApplicationController errors, don't use 
#		controllers in the gem.  Models and unit tests
#		seem to work just fine as they are subclasses of 
#		ActiveRecord::Base.  Controllers are subclasses of
#		ApplicationController, which is in the application.
#
#	TODO copy routes maybe?	How to copy in the complex route?
#				Simple, restful route is simple.
#				Probably have to do this manually.
#
#	TODO copy controllers, views and functional tests.
#		there are no views

#			m.directory('app/views/photos')
#			Dir["#{dot}/templates/views/photos/*rb"].each{|file| 
#				f = file.split('/').slice(-3,3).join('/')
#	has an extra directory in path which is needed in m.file(f
#	which is relative to templates/
#				m.file(f, "app/views/photos/#{File.basename(file)}")
#			}
#
#	more generic way (not yet actually tested)

			Dir["#{dot}/templates/views/*/**/"].each do |dir|
				last_dir = dir.split('/').last
				m.directory("app/views/#{last_dir}")
				Dir["#{dot}/templates/views/#{last_dir}/*rb"].each do |file|
					f = file.split('/').slice(-3,3).join('/')
					m.file(f, "app/views/#{last_dir}/#{File.basename(file)}")
				end
			end

			m.directory('app/controllers')
			Dir["#{dot}/templates/controllers/*rb"].each{|file| 
				f = file.split('/').slice(-2,2).join('/')
				m.file(f, "app/controllers/#{File.basename(file)}")
			}
			m.directory('test/functional')
			Dir["#{dot}/templates/functional/*rb"].each{|file| 
				f = file.split('/').slice(-2,2).join('/')
				m.file(f, "test/functional/#{File.basename(file)}")
			}

#			m.directory('test/unit/authorized')
#			Dir["#{dot}/templates/unit/*rb"].each{|file| 
#				f = file.split('/').slice(-2,2).join('/')
#				m.file(f, "test/unit/authorized/#{File.basename(file)}")
#			}

		end
	end

end
module Rails::Generator::Commands
	class Create
		def migration_template(relative_source, 
				relative_destination, template_options = {})
			migration_directory relative_destination
			migration_file_name = template_options[
				:migration_file_name] || file_name
			if migration_exists?(migration_file_name)
				puts "Another migration is already named #{migration_file_name}: #{existing_migrations(migration_file_name).first}: Skipping" 
			else
				template(relative_source, "#{relative_destination}/#{next_migration_string}_#{migration_file_name}.rb", template_options)
			end
		end
	end #	Create
	class Base
	protected
		#	the loop through migrations happens so fast
		#	that they all have the same timestamp which
		#	won't work when you actually try to migrate.
		#	All the timestamps MUST be unique.
		def next_migration_string(padding = 3)
			@s = (!@s.nil?)? @s.to_i + 1 : if ActiveRecord::Base.timestamped_migrations
				Time.now.utc.strftime("%Y%m%d%H%M%S")
			else
				"%.#{padding}d" % next_migration_number
			end
		end
	end	#	Base
end
