require_relative "../integration_test"

class LeaderboardsControllerTest < IntegrationTest
  test "should show leaderboard" do
    sign_in_user
    get leaderboard_url
    assert_response :success
  end
end
