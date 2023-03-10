require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should update user" do
    patch user_url(@user), params: { user: {} }
    assert_redirected_to url_url(@url)
  end
end
