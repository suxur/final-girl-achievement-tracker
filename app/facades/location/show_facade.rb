class Location::ShowFacade < ShowFacade
  def icon_path
    location.icon
  end

  def logo_path
    location.logo
  end

  def has_logo?
    location.logo.attached?
  end

  def fields_for_type
    :user_location_achievements
  end

  def achievements
    location.achievements
  end

  def achievement_type
    :location_achievement
  end

  def achievement_type_id
    :location_achievement_id
  end

  def has_method
    :has_killers
  end

  def chooseables
    @chooseables ||= Killer.all.collect { |p| [p.name, p.id] }
  end

  def chooseable_id
    :killer_id
  end

  def chooseable_type
    :killer_id
  end

  def chooseable_prompt
    "Choose a Killer"
  end

  def current_achievements
    return current_location_achievements if has_current_location_achievements?
    built_achievements
  end

  private

  def location
    @location ||= Location.find_by(slug: @params[:slug])
  end

  def has_current_location_achievements?
    current_location_achievements.any?
  end

  def current_location_achievements
    @user.user_location_achievements.where(location_achievement_id: achievements)
  end

  def built_achievements
    achievements.map do |achievement|
      @user.user_location_achievements.build(location_achievement_id: achievement.id)
    end
  end
end
