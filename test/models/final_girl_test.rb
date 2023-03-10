require "test_helper"

class FinalGirlTest < ActiveSupport::TestCase
  def setup
    @final_girl = final_girls(:one)
  end

  context "associations" do
    should belong_to :series
  end

  def test_to_param
    assert_equal @final_girl.slug, @final_girl.to_param
  end
end
