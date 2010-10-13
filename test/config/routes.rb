ActionController::Routing::Routes.draw do |map|

	#	This routes is just for testing the session 'hash'
	map.resource :session, :only => [ :show ]

end
