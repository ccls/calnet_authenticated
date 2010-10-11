module CalnetAuthenticated
#	predefine namespace
end
require 'calnet_authenticated/user_model'
require 'calnet_authenticated/controller'

%w{models controllers}.each do |dir|
	path = File.expand_path(File.join(File.dirname(__FILE__), '../app', dir))
# $LOAD_PATH << path
#	ActiveSupport::Dependencies.autoload_once_paths.delete(path)
#	ActiveSupport::Dependencies.autoload_once_paths << path
	ActiveSupport::Dependencies.autoload_paths << path
end

ActionController::Routing::Routes.add_configuration_file(
	File.expand_path(
		File.join(
			File.dirname(__FILE__), '../config/routes.rb')))
