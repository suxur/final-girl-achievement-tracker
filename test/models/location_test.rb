require "test_helper"

class LocationTest < ActiveSupport::TestCase
  def setup
    @location = locations(:one)
  end

  context "associations" do
    should belong_to :series
    should have_many :achievements
    should have_one_attached :logo
    should have_one_attached :icon
  end

  def test_to_param
    assert_equal @location.slug, @location.to_param
  end
end
