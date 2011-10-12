require 'active_record'
require 'active_support'
require 'action_controller'

gem 'ccls-common_lib'
require 'common_lib'

#gem 'ccls-ruby_extension'
#require 'ruby_extension'

#gem 'ccls-simply_helpful'
#require 'simply_helpful'

gem 'rubycas-client', '>= 2.2.1'
require 'rubycas-client'

require 'casclient'
require 'casclient/frameworks/rails/filter'

gem 'ucb_ldap', '>= 1.4.2'
require 'ucb_ldap'

gem 'ccls-simply_authorized'
require 'simply_authorized'

gem 'ryanb-acts-as-list'
require 'acts_as_list'

#gem 'ccls-rails_extension'
#require 'ccls-rails_extension'

#	Don't know if I use CalnetAuthenticated namespace anymore
module CalnetAuthenticated
#	predefine namespace
end
module Calnet
#	predefine namespace
end

require 'calnet_authenticated/calnet_user'
require 'calnet_authenticated/controller'

#	I don't think that this is needed
#	Apparently it is.  I don't quite understand
#	why my ccls_engine doesn't.
%w{models controllers}.each do |dir|
	path = File.expand_path(File.join(File.dirname(__FILE__), '../app', dir))
	ActiveSupport::Dependencies.autoload_paths << path
	ActiveSupport::Dependencies.autoload_once_paths << path
end

#	I don't think this is needed
#
#	Why do I need this for calnet_authenticated,
#	but not for authorized or photos or ...
#
#	I think that it depends on whether the gem is
#	explictly added to the configuration with config.gem
#	or just a dependency with a require.
#	Since buffler and clic and engine only have config.gem ccls_engine,
#	we need to be explicit, which is probably better anyway.
ActionController::Routing::Routes.add_configuration_file(
	File.expand_path(
		File.join(
			File.dirname(__FILE__), '../config/routes.rb')))

HTML::WhiteListSanitizer.allowed_attributes.merge(%w(
	id class style
))

if defined?(Rails) && Rails.env == 'test' && Rails.class_variable_defined?("@@configuration")
	require 'active_support/test_case'
	require 'calnet_authenticated/test_helper'
	require 'factory_girl'
end

ActionController::Base.view_paths <<
	File.expand_path(
		File.join(
			File.dirname(__FILE__), '../app/views'))

gem 'paperclip'
require 'paperclip'
if defined? ::Paperclip::Glue
	ActiveRecord::Base.send(:include, ::Paperclip::Glue)
else
	#	older versions did not have "Glue"
	ActiveRecord::Base.send(:include, ::Paperclip)
end

