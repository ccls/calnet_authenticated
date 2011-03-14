require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

begin
	require 'jeweler'
	Jeweler::Tasks.new do |gem|
		gem.name = "ccls-calnet_authenticated"
		gem.summary = %Q{one-line summary of your gem}
		gem.description = %Q{longer description of your gem}
		gem.email = "github@jakewendt.com"
		gem.homepage = "http://github.com/ccls/calnet_authenticated"
		gem.authors = ["George 'Jake' Wendt"]
		# gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings

		gem.files  = FileList['config/routes.rb']
		gem.files += FileList['app/**/*.rb']
		gem.files += FileList['lib/**/*.rb']
		gem.files += FileList['generators/**/*']	#	this may need tightened!
		gem.files -= FileList['**/versions/*']

#   
#		I'm not quite sure if it matters whether these files
#		are included as 'files' or 'test_files', but
#		they need to be included if I'm gonna use'em.
#
		gem.test_files  = FileList['test/**/*.rb']
		gem.test_files -= FileList['test/test_helper.rb']

		gem.add_dependency('rails', '~> 2')
		gem.add_dependency('ucb_ldap', '>= 1.4.2')
		gem.add_dependency('rubycas-client', '>= 2.2.1')
		gem.add_dependency('jrails')
		gem.add_dependency('jakewendt-simply_helpful')
		gem.add_dependency('jakewendt-ruby_extension')
		gem.add_dependency('jakewendt-simply_authorized')
		gem.add_dependency('chronic')
		gem.add_dependency('ssl_requirement')
		gem.add_dependency('ryanb-acts-as-list')
		gem.add_dependency('gravatar')
		gem.add_dependency('paperclip')	#	not all apps use, but should be there
		gem.add_dependency('thoughtbot-factory_girl')
		gem.add_dependency('jakewendt-simply_pages')
		gem.add_dependency('jakewendt-rails_extension')
		gem.add_dependency('RedCloth','!= 4.2.6')

	end
	Jeweler::GemcutterTasks.new
rescue LoadError
	puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require(File.join(File.dirname(__FILE__), 'config', 'boot'))
require 'tasks/rails'
