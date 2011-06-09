ActionController::Routing::Routes.draw do |map|

#	map.logout 'logout', :controller => 'sessions', :action => 'destroy'
#
#	#	This routes is just for testing the session 'hash'
#	map.resource :session, :only => [ :show ]
#
#	map.resources :users, :only => [:destroy,:show,:index] 

	map.resource :home, :only => :show
	map.root :controller => :home, :action => :show

end
