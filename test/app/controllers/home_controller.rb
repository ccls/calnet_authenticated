class HomeController < ApplicationController

	skip_before_filter :login_required

	def show
	end

end
