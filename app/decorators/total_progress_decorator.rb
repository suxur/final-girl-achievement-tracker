class TotalProgressDecorator < BaseDecorator
  def total_progress
    CalculateProgress.call(completed_achievements, total_achievements)
  end

  private

  # def total_achievements
  #   killer_achievement_count + location_achievement_count
  # end

  # def killer_achievement_count
  #   KillerAchievement.all.count
  # end

  # def location_achievement_count
  #   LocationAchievement.all.count
  # end

  # def total_user_achievements
  #   user_killer_achievement_count + user_location_achievement_count
  # end

  # def user_killer_achievement_count
  #   user_killer_achievements.where(completed: true).count
  # end

  # def user_location_achievement_count
  #   user_location_achievements.where(completed: true).count
  # end
end
