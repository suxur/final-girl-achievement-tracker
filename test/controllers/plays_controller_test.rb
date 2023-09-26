require_relative "../integration_test"

class PlaysControllerTest < IntegrationTest
  setup do
    sign_in users(:one)
    @play = plays(:two)
  end

  test "should get index" do
    get plays_url
    assert_response :success
  end

  test "should get new" do
    get new_play_url
    assert_response :success
  end

  test "should create play" do
    assert_difference("Play.count") do
      post plays_url, params: {play: play_params}
    end
    assert_redirected_to plays_url
  end

  test "should render new if play is invalid" do
    assert_no_difference("Play.count") do
      post plays_url, params: {play: {final_girl_id: ""}}
    end
    assert_response :unprocessable_entity
  end

  test "should get edit" do
    get edit_play_url(@play)
    assert_response :success
  end

  test "should update play" do
    patch play_url(@play), params: {play: play_params}
    assert_equal final_girls(:one).id, @play.reload.final_girl.id
    assert_redirected_to plays_url
  end

  test "should render edit if play is invalid" do
    patch play_url(@play), params: {play: {final_girl_id: ""}}
    assert_equal final_girls(:two).id, @play.reload.final_girl.id
    assert_response :unprocessable_entity
  end

  test "should destroy play" do
    assert_difference("Play.count", -1) { delete play_url(@play) }
    assert_redirected_to plays_url
  end

  private

  def play_params
    {
      final_girl_id: final_girls(:one).id,
      killer_id: killers(:one).id,
      location_id: locations(:one).id
    }
  end
end
