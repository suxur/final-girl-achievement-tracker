class Killer::ShowFacade < ShowFacade
  def fields_for_type
    :user_killer_achievements
  end

  def achievement_type
    :killer_achievement
  end

  def achievement_type_id
    :killer_achievement_id
  end

  def has_method
    :has_locations
  end

  def chooseable
    @chooseable ||= Chooseable::Locations.new
  end

  def current_achievements
    return current_killer_achievements if has_current_killer_achievements?
    built_achievements
  end

  def back_path
    [:killers]
  end

  private

  def record
    @killer ||= Killer.find_by(slug: @params[:slug])
  end
  alias_method :killer, :record

  def has_current_killer_achievements?
    current_killer_achievements.any?
  end

  def current_killer_achievements
    user
      .user_killer_achievements
      .where(killer_achievement_id: achievements)
      .order(:killer_achievement_id)
  end

  def built_achievements
    achievements.map do |achievement|
      user.user_killer_achievements.build(
        killer_achievement_id: achievement.id
      )
    end
  end
end
