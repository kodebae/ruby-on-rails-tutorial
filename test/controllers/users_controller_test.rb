require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should get signup" do
    get signup_path
    assert_response :success
  end

  test "should reject invalid signup information" do
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                       email: "user@invalid",
                                       password: "foo",
                                       password_confirmation: "bar" } }
    end
    assert_response :unprocessable_entity
  end

  test "should accept valid signup information" do
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "Example User",
                                       email: "user@example.com",
                                       password: "password",
                                       password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { email: @user.email, name: @user.name, 
                                      password: "foobar", password_confirmation: "foobar" } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: @user.email, name: @user.name } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
