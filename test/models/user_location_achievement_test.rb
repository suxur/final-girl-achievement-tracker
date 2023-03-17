require "test_helper"

class UserLocationAchievementTest < ActiveSupport::TestCase
  setup { @location = locations(:one) }

  context "associations" do
    should belong_to :user
    should belong_to :location_achievement
    should belong_to(:killer).optional
  end

  test "completed scope" do
    assert_equal(2, completed_scope.count)
    assert(completed_scope.all? { |x| x.completed? })
    refute(completed_scope.none? { |x| x.completed? })
    refute_includes(completed_scope, user_location_achievements(:three))
  end

  test "not_completed scope" do
    assert_equal(1, not_completed_scope.count)
    refute(not_completed_scope.all? { |x| x.completed? })
    assert(not_completed_scope.none? { |x| x.completed? })
    refute_includes(not_completed_scope, user_location_achievements(:one))
    refute_includes(not_completed_scope, user_location_achievements(:two))
  end

  private

  def completed_scope
    UserLocationAchievement.completed(location_achievement_ids)
  end

  def not_completed_scope
    UserLocationAchievement.not_completed(location_achievement_ids)
  end

  def location_achievement_ids
    @location.achievements.pluck(:id)
  end
end
