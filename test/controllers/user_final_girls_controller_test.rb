require_relative "../integration_test"

class UserFinalGirlsControllerTest < IntegrationTest
  setup do
    sign_in_admin
    @final_girl = final_girls(:three)
  end

  test "should get index" do
    get user_final_girls_url
    assert_response :success
  end

  test "should get new" do
    get new_user_final_girl_url
    assert_response :success
  end

  test "should create final girl" do
    assert_difference("FinalGirl.count") do
      post user_final_girls_url, params: {final_girl: final_girl_params}
    end
    assert_redirected_to user_final_girls_url
  end

  test "should render new if final girl is invalid" do
    assert_no_difference("FinalGirl.count") do
      post user_final_girls_url, params: {final_girl: {name: ""}}
    end
    assert_response :unprocessable_entity
  end

  test "should get edit" do
    get edit_user_final_girl_url(@final_girl)
    assert_response :success
  end

  test "should update final girl" do
    patch user_final_girl_url(@final_girl), params: {final_girl: final_girl_params}
    assert_equal "New Final Girl", @final_girl.reload.name
    assert_redirected_to user_final_girls_url
  end

  test "should render edit if final girl is invalid" do
    patch user_final_girl_url(@final_girl), params: {final_girl: {name: ""}}
    assert_response :unprocessable_entity
  end

  test "should destroy play" do
    assert_difference("FinalGirl.count", -1) { delete user_final_girl_url(@final_girl) }
    assert_redirected_to user_final_girls_url
  end

  private

  def final_girl_params
    {name: "New Final Girl"}
  end
end
