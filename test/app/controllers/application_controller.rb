class ApplicationController < ActionController::Base
#
#	def redirections
#		@redirections ||= HashWithIndifferentAccess.new({
#			:not_be_user => {
#				:redirect_to => user_path(current_user)
#			}
#		})
#	end
#

	helper :all # include all helpers, all the time

	# See ActionController::RequestForgeryProtection for details
	protect_from_forgery

end
