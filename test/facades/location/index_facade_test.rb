require "test_helper"

class Location::IndexFacadeTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @facade = Location::IndexFacade.new(@user, {})
  end

  def test_collection_is_grouped_by_series
    assert_equal "Series 1", @facade.collection.keys[1]
    assert_equal "Series 2", @facade.collection.keys[0]
  end

  def test_collection_has_progress_card_data
    assert_instance_of ProgressCardData, progress_data
  end

  def test_collection_has_progress_card_data_with_correct_data
    assert_equal locations(:one), progress_data.record
    assert_equal "Series 1", progress_data.series
    assert_equal "Camp Happy Trails", progress_data.name
    assert_equal 67, progress_data.progress
    assert_instance_of ActiveStorage::Attached::One, progress_data.icon
  end

  private

  def progress_data
    @facade.collection.values[1][0]
  end
end
