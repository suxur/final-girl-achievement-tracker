require "test_helper"

class FinalGirlSeriesTest < ActiveSupport::TestCase
  context "associations" do
    should belong_to :final_girl
    should belong_to :series
  end
end
