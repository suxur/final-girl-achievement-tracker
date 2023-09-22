require "test_helper"

class Killer::IndexFacadeTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @facade = Killer::IndexFacade.new(@user, {})
  end

  def test_collection_is_grouped_by_series
    assert_equal "Series 1", @facade.collection.keys[1]
    assert_equal "Series 2", @facade.collection.keys[0]
  end
end
