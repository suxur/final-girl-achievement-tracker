require "test_helper"

class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @location = locations(:one)
  end

  test "should show location" do
    get location_url(@location)
    assert_response :success
  end
end
