require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "should get new" do
    get login_path
    assert_response :success
  end

  test "should get create" do
    post login_path, params: { session: { email: @user.email, password: 'password' } }
    assert_redirected_to @user
  end

  test "should get destroy" do
    log_in_as(@user)
    delete logout_path
    assert_redirected_to root_url
  end
end
