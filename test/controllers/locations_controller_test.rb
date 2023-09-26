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

  test "a user should not get new" do
    sign_in_user
    get new_location_url
    assert_response :redirect
  end

  test "an admin should get new" do
    sign_in_admin
    get new_location_url
    assert_response :success
  end

  test "a user should not create location" do
    sign_in_user
    assert_no_difference("Location.count") do
      post locations_url, params: {location: location_params}
    end
    assert_redirected_to root_url
  end

  test "an admin should create location" do
    sign_in_admin
    assert_difference("Location.count") do
      post locations_url, params: {location: location_params}
    end
    assert_redirected_to locations_url
  end

  test "should render new if location is invalid" do
    sign_in_admin
    assert_no_difference("Location.count") do
      post locations_url, params: {location: {name: ""}}
    end
    assert_response :unprocessable_entity
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
    patch location_url(@location), params: {location: location_params}
    assert_equal "Camp Happy Trails", @location.reload.name
    assert_response :redirect
  end

  test "an admin should update location" do
    sign_in_admin
    patch location_url(@location), params: {location: location_params}
    assert_equal "New Location", @location.reload.name
    assert_redirected_to location_url(@location)
  end

  private

  def location_params
    {
      name: "New Location",
      series_id: series(:one).id
    }
  end
end
