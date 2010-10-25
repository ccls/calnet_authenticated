# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.10' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

	#	rails 3 requires i18n gem which will load
	#	a version incompatible with 2.3.8.
	#	It will generate several of ...
	#	The {{key}} interpolation syntax in I18n 
	#	messages is deprecated. Please use %{key} instead.
	#	This must be called early, or someone else will load a newer version.
	config.gem "i18n", :version => '=0.3.7'

	# For CAS / CalNet Authentication
	config.gem "rubycas-client"

	# probably will come from http://gemcutter.org/gems/ucb_ldap
	# version 1.3.2 as of Jan 25, 2010
	config.gem "ucb_ldap", :source => "http://gemcutter.org"

	config.gem "thoughtbot-factory_girl",
		:lib    => "factory_girl",
		:source => "http://gems.github.com"

	config.gem 'jakewendt-assert_this_and_that',
		:lib => 'assert_this_and_that',
		:source => 'http://rubygems.org'

	config.gem 'jakewendt-simply_helpful',
		:lib => 'simply_helpful',
		:source => 'http://rubygems.org'

	config.plugin_paths = [
		File.expand_path(File.join(File.dirname(__FILE__),'../..')),
		File.expand_path(File.join(File.dirname(__FILE__),'../../..','peter'))
	]
	config.plugins = [ :calnet_authenticated,
		:html_test, :html_test_extension]

	config.frameworks -= [:active_resource]

	config.routes_configuration_file = File.expand_path(
		File.join(File.dirname(__FILE__),'..','test/config/routes.rb'))

	config.autoload_paths += [
		File.expand_path(
			File.join(File.dirname(__FILE__),'..','test/app/models')),
		File.expand_path(
			File.join(File.dirname(__FILE__),'..','test/app/controllers'))
	]

	config.view_path = [
		File.expand_path(
			File.join(File.dirname(__FILE__),'..','test/app/views'))
	]

	if RUBY_PLATFORM =~ /java/
		#	I'm surprised that I don't need this in my apps.
		config.gem 'activerecord-jdbcsqlite3-adapter',
			:lib => 'active_record/connection_adapters/jdbcsqlite3_adapter'
		config.gem 'jdbc-sqlite3', :lib => 'jdbc/sqlite3'
		config.gem 'jruby-openssl', :lib => 'openssl'
	else
		config.gem "sqlite3-ruby", :lib => "sqlite3"
	end

end
