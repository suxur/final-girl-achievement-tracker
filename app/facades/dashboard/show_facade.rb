class Dashboard::ShowFacade < IndexFacade
  def all_killer_achievement_progress
    (
      (user_killer_achievement_count / killer_achievement_count.to_f) * 100
    ).round
  end

  def all_location_achievement_progress
    (
      (user_location_achievement_count / location_achievement_count.to_f) * 100
    ).round
  end

  def play_chart_data
    return {} if total_plays.zero? || win_loss_play_counts.empty?
    {
      Loss: ((loss_count / total_plays) * 100).round,
      Win: ((win_count / total_plays) * 100).round,
    }
  end

  private

  def killer_achievement_count
    KillerAchievement.count
  end

  def user_killer_achievement_count
    @user.user_killer_achievements.where(completed: true).count
  end

  def location_achievement_count
    LocationAchievement.count
  end

  def user_location_achievement_count
    @user.user_location_achievements.where(completed: true).count
  end

  def total_plays
    win_loss_play_counts.values.sum.to_f
  end

  def win_count
    win_loss_play_counts[true] || 0
  end

  def loss_count
    win_loss_play_counts[false] || 0
  end

  def win_loss_play_counts
    @user.plays.group(:is_win).count
  end
end
