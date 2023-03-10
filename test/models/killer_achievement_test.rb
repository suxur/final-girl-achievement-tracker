require "test_helper"

class KillerAchievementTest < ActiveSupport::TestCase
  context "associations" do
    should belong_to :killer
  end
end
