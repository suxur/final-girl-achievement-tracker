require "test_helper"

class PlaysControllerTest < ActionDispatch::IntegrationTest
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
      post plays_url, params: { play: play_params }
    end

    assert_redirected_to plays_url
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
      location_id: locations(:one).id,
    }
  end
end
