require "test_helper"

class KillersControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @killer = killers(:one)
  end

  test "should get index" do
    get killers_url
    assert_response :success
  end

  test "should show killer" do
    get killer_url(@killer)
    assert_response :success
  end

  test "should get edit" do
    get edit_killer_url(@killer)
    assert_response :success
  end

  test "should update killer" do
    patch killer_url(@killer), params: { killer: { name: "New Name" } }
    assert_equal "New Name", @killer.reload.name
    assert_redirected_to killer_url(@killer)
  end
end
