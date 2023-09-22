require "test_helper"

class Play::IndexFacadeTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @facade = Play::IndexFacade.new(@user)
  end

  def test_plays
    assert_equal 2, @facade.plays.count
  end
end
