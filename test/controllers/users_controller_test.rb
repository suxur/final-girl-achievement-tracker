require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should update user" do
    patch user_url(@user), params: { user: user_params }
    assert_redirected_to root_path
  end

  private

  def user_params
    {
      user_killer_achievements_attributes: [
        {
          id: user_killer_achievements(:one).id,
          killer_achievement_id: killer_achievements(:one).id,
          location_id: locations(:one).id,
          completed: true,
        },
      ],
    }
  end
end
