require "test_helper"

class LocationAchievementTest < ActiveSupport::TestCase
  context "associations" do
    should belong_to :location
  end
end
