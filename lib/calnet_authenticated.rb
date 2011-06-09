require 'active_record'
require 'active_support'
require 'action_controller'

require 'ruby_extension'
require 'simply_helpful'
require 'gravatar'

gem 'rubycas-client', '>= 2.2.1'
require 'rubycas-client'
require 'casclient'
require 'casclient/frameworks/rails/filter'
gem 'ucb_ldap', '>= 1.4.2'
require 'ucb_ldap'

require 'simply_authorized'
require 'acts_as_list'
require 'simply_pages'
require 'jakewendt-rails_extension'

module CalnetAuthenticated
#	predefine namespace
end
module Calnet
#	predefine namespace
end
require 'calnet_authenticated/calnet_user'
require 'calnet_authenticated/controller'
#require 'calnet_authenticated/test_helper'

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
#	else
#		running a rake task
end




#	silence_warnings {
#		#	This will complain that the constant is already defined.
#		ActionView::Helpers::AssetTagHelper::JAVASCRIPT_DEFAULT_SOURCES = [
#			'jquery','jquery-ui','jrails']
#	}
#	#ActionView::Helpers::AssetTagHelper::reset_javascript_include_default
#	#ActionView::Helpers::AssetTagHelper.register_javascript_include_default(
#	#	'ucb_ccls_engine.js')
#	ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion( 
#		:defaults => ['scaffold','application'] )





ActionController::Routing::Routes.add_configuration_file(
	File.expand_path(
		File.join(
			File.dirname(__FILE__), '../config/routes.rb')))

#ActionController::Base.view_paths <<
#	File.expand_path(
#		File.join(
#			File.dirname(__FILE__), '../app/views'))

require 'paperclip'
if defined? ::Paperclip::Glue
	ActiveRecord::Base.send(:include, ::Paperclip::Glue)
else
	ActiveRecord::Base.send(:include, ::Paperclip)
end

