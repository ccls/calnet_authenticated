ActionController::Routing::Routes.draw do |map|

	map.logout 'logout', :controller => 'sessions', :action => 'destroy'

	map.resources :sessions, :only => [ :destroy ]

end
