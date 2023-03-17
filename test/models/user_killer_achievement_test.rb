require "test_helper"

class UserKillerAchievementTest < ActiveSupport::TestCase
  setup { @killer = killers(:one) }

  context "associations" do
    should belong_to :user
    should belong_to :killer_achievement
    should belong_to(:location).optional
  end

  test "completed scope" do
    assert_equal(2, completed_scope.count)
    assert(completed_scope.all? { |x| x.completed? })
    refute(completed_scope.none? { |x| x.completed? })
    refute_includes(completed_scope, user_killer_achievements(:three))
  end

  test "not_completed scope" do
    assert_equal(1, not_completed_scope.count)
    refute(not_completed_scope.all? { |x| x.completed? })
    assert(not_completed_scope.none? { |x| x.completed? })
    refute_includes(not_completed_scope, user_killer_achievements(:one))
    refute_includes(not_completed_scope, user_killer_achievements(:two))
  end

  private

  def completed_scope
    UserKillerAchievement.completed(killer_achievement_ids)
  end

  def not_completed_scope
    UserKillerAchievement.not_completed(killer_achievement_ids)
  end

  def killer_achievement_ids
    @killer.achievements.pluck(:id)
  end
end
