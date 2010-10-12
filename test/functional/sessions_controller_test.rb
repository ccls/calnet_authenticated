require File.dirname(__FILE__) + '/../test_helper'

class SessionsControllerTest < ActionController::TestCase

	test "should logout if authenticated" do
		login_as Factory(:user)
		assert_logged_in
		delete :destroy
		assert_redirected_to_logout
	end

	test "should NOT logout if NOT authenticated" do
		assert_not_logged_in
		delete :destroy
		assert_redirected_to_login
	end

end
