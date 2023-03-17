class Location::IndexFacade < IndexFacade
  def collection
    locations.group_by { |l| l.series }
  end

  def locations
    Location.order(:id).map { |l| progress_card_data(l) }
  end

  private

  def progress_card_data(location)
    ProgressCardData.new(
      location,
      location.series.name,
      location.name,
      CalculateProgress.new(
        completed_achievements(location),
        total_achievements(location),
      ).call,
      location.icon,
    )
  end

  def completed_achievements(location)
    @user.user_location_achievements.completed(total_achievements(location))
  end

  def total_achievements(location)
    location.achievements
  end
end
