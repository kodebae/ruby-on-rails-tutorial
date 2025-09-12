require "test_helper"

class StaticPagesTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "h1", "Welcome to Kodebae's Sample App"
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

  test "should get root" do
    get root_path
    assert_response :success
  end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
end
