require "test_helper"

class KillerTest < ActiveSupport::TestCase
  def setup
    @killer = killers(:one)
  end

  context "associations" do
    should belong_to :series
    should have_many :achievements
    should have_one_attached :logo
    should have_one_attached :icon
  end

  def test_to_param
    assert_equal @killer.slug, @killer.to_param
  end
end
