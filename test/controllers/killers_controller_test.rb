require_relative "../integration_test"

class KillersControllerTest < IntegrationTest
  setup do
    @killer = killers(:one)
  end

  test "should get index" do
    sign_in_user
    get killers_url
    assert_response :success
  end

  test "should show killer" do
    sign_in_user
    get killer_url(@killer)
    assert_response :success
  end

  test "a user should not get new" do
    sign_in_user
    get new_killer_url
    assert_response :redirect
  end

  test "an admin should get new" do
    sign_in_admin
    get new_killer_url
    assert_response :success
  end

  test "a user should not create killer" do
    sign_in_user
    assert_no_difference("Killer.count") do
      post killers_url, params: {killer: killer_params}
    end
    assert_redirected_to root_url
  end

  test "an admin should create killer" do
    sign_in_admin
    assert_difference("Killer.count") do
      post killers_url, params: {killer: killer_params}
    end
    assert_redirected_to killers_url
  end

  test "a user should not get edit" do
    sign_in_user
    get edit_killer_url(@killer)
    assert_response :redirect
  end

  test "an admin should get edit" do
    sign_in_admin
    get edit_killer_url(@killer)
    assert_response :success
  end

  test "a user should not update killer" do
    sign_in_user
    patch killer_url(@killer), params: {killer: killer_params}
    assert_equal "Hans", @killer.reload.name
    assert_response :redirect
  end

  test "an admin should update killer" do
    sign_in_admin
    patch killer_url(@killer), params: {killer: killer_params}
    assert_equal "New Killer", @killer.reload.name
    assert_redirected_to killer_url(@killer)
  end

  private

  def killer_params
    {
      name: "New Killer",
      series_id: series(:one).id
    }
  end
end
