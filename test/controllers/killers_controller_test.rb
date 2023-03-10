require "test_helper"

class KillersControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @killer = killers(:one)
  end

  test "should show killer" do
    get killer_url(@killer)
    assert_response :success
  end
end
