require "test_helper"

class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @location = locations(:one)
  end

  test "should get index" do
    get locations_url
    assert_response :success
  end

  test "should show location" do
    get location_url(@location)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_url(@location)
    assert_response :success
  end

  test "should update location" do
    patch location_url(@location), params: { location: { name: "New Name" } }
    assert_equal "New Name", @location.reload.name
    assert_redirected_to location_url(@location)
  end
end
