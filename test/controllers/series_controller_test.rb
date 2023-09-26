require_relative "../integration_test"

class SeriesControllerTest < IntegrationTest
  setup do
    @series = series(:one)
  end

  test "a user should not get index" do
    sign_in_user
    get series_index_url
    assert_response :redirect
  end

  test "an admin should get index" do
    sign_in_admin
    get series_index_url
    assert_response :success
  end

  test "a user should not get new" do
    sign_in_user
    get new_series_url
    assert_response :redirect
  end

  test "an admin should get new" do
    sign_in_admin
    get new_series_url
    assert_response :success
  end

  test "a user should not create series" do
    sign_in_user
    assert_no_difference("Series.count") do
      post series_index_url, params: {series: {name: "New Name"}}
    end
    assert_response :redirect
  end

  test "an admin should create series" do
    sign_in_admin
    assert_difference("Series.count") do
      post series_index_url, params: {series: {name: "New Name"}}
    end
    assert_redirected_to series_index_url
  end

  test "should render new if series is invalid" do
    sign_in_admin
    assert_no_difference("Series.count") do
      post series_index_url, params: {series: {name: ""}}
    end
    assert_response :unprocessable_entity
  end

  test "a user should not get edit" do
    sign_in_user
    get edit_series_url(@series)
    assert_response :redirect
  end

  test "an admin should get edit" do
    sign_in_admin
    get edit_series_url(@series)
    assert_response :success
  end

  test "a user should not update series" do
    sign_in_user
    patch series_url(@series), params: {series: {name: "New Name"}}
    assert_equal "Series 1", @series.reload.name
    assert_response :redirect
  end

  test "an admin should update series" do
    sign_in_admin
    patch series_url(@series), params: {series: {name: "New Name"}}
    assert_equal "New Name", @series.reload.name
    assert_redirected_to series_url(@series)
  end
end
