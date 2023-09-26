require "test_helper"

class ShowFacadeTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @facade = ShowFacade.new(@user)
  end

  def test_record
    assert_raises(NotImplementedError) { @facade.record }
  end
end
