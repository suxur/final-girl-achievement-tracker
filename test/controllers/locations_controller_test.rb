require_relative "../integration_test"

class LocationsControllerTest < IntegrationTest
  setup do
    @location = locations(:one)
  end

  test "should get index" do
    sign_in_user
    get locations_url
    assert_response :success
  end

  test "should show location" do
    sign_in_user
    get location_url(@location)
    assert_response :success
  end

  test "a user should not get edit" do
    sign_in_user
    get edit_location_url(@location)
    assert_response :redirect
  end

  test "an admin should get edit" do
    sign_in_admin
    get edit_location_url(@location)
    assert_response :success
  end

  test "a user should not update location" do
    sign_in_user
    patch location_url(@location), params: {location: {name: "New Name"}}
    assert_equal "Camp Happy Trails", @location.reload.name
    assert_response :redirect
  end

  test "an admin should update location" do
    sign_in_admin
    patch location_url(@location), params: {location: {name: "New Name"}}
    assert_equal "New Name", @location.reload.name
    assert_redirected_to location_url(@location)
  end
end
