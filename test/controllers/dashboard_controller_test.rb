require_relative "../integration_test"

class DashboardControllerTest < IntegrationTest
  test "should show dashboard" do
    sign_in_user
    get dashboard_url
    assert_response :success
  end
end
