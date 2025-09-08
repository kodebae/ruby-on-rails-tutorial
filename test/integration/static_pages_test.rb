require "test_helper"

class StaticPagesTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "h1", "Sample App"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "h1", "Help"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "h1", "About"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "h1", "Contact"
  end
end
