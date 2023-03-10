require "test_helper"

class UserKillerAchievementTest < ActiveSupport::TestCase
  context "associations" do
    should belong_to :user
    should belong_to :killer_achievement
    should belong_to :location
  end
end
