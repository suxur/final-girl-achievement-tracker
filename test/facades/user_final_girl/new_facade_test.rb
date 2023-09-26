require "test_helper"

class UserFinalGirl::NewFacadeTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @facade = UserFinalGirl::NewFacade.new(@user)
  end

  def test_model_instance
    assert_instance_of FinalGirl, @facade.model
  end
end
