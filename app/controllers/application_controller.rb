class ApplicationController < ActionController::Base

	helper :all # include all helpers, all the time

	# See ActionController::RequestForgeryProtection for details
	protect_from_forgery

	#	Now that I've added a is_not_user?/may_not_be_user? method to simply_authorized
	#	using this cleaner and clearer method.
	#	used in roles_controller
	def may_not_be_user_required
		current_user.may_not_be_user?(@user) || access_denied(
			"You may not be this user to do this", user_path(current_user))
	end

end

__END__

#	def redirections
#		@redirections ||= HashWithIndifferentAccess.new({
#			:not_be_user => {
#				:redirect_to => user_path(current_user)
#			}
#		})
#	end
