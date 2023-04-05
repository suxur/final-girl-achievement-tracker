require "test_helper"

class LeaderboardsControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in users(:one) }

  test "should show leaderboard" do
    get leaderboard_url
    assert_response :success
  end
end
