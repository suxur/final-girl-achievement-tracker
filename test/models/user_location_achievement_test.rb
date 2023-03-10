require "test_helper"

class UserLocationAchievementTest < ActiveSupport::TestCase
  context "associations" do
    should belong_to :user
    should belong_to :location_achievement
    should belong_to :killer
  end
end
