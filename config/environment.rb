# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.14' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

	if RUBY_PLATFORM =~ /java/
		#	I'm surprised that I don't need this in my apps.
		config.gem 'activerecord-jdbcsqlite3-adapter',
			:lib => 'active_record/connection_adapters/jdbcsqlite3_adapter'
		config.gem 'jdbc-sqlite3', :lib => 'jdbc/sqlite3'
		config.gem 'jruby-openssl', :lib => 'openssl'
	else
		config.gem "sqlite3"
	end

	# For CAS / CalNet Authentication
	config.gem "rubycas-client"

	# probably will come from http://gemcutter.org/gems/ucb_ldap
	# version 1.3.2 as of Jan 25, 2010
	config.gem "ucb_ldap", :source => "http://gemcutter.org"

	config.gem "thoughtbot-factory_girl",
		:lib    => "factory_girl",
		:source => "http://gems.github.com"

	config.gem 'ccls-common_lib'
	config.gem 'ccls-simply_authorized'
	config.gem 'ccls-html_test'
	config.gem 'jrails'

	config.frameworks -= [:active_resource]


#	Not necessary anymore

	#	load test/config/routes.rb file.
	#	config/routes.rb will load when the lib is loaded
#	config.routes_configuration_file = File.expand_path(
#		File.join(File.dirname(__FILE__),'..','test/config/routes.rb'))

	config.after_initialize do
		load File.expand_path(File.join(File.dirname(__FILE__),'../lib/calnet_authenticated.rb'))
	end

end
