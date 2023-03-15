require "test_helper"

class PlaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @play = plays(:one)
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
    assert_difference("Play.count") { post plays_url, params: { play: {} } }

    assert_redirected_to plays_url
  end

  test "should destroy play" do
    assert_difference("Play.count", -1) { delete play_url(@play) }

    assert_redirected_to plays_url
  end
end
