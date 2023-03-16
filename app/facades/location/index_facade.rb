class Location::IndexFacade < IndexFacade
  def collection
    locations.group_by { |l| l.series }
  end

  def locations
    Location.all.map do |location|
      ProgressCardData.new(
        location,
        location.series.name,
        location.name,
        calculate_progress(location),
        location.icon,
      )
    end
  end

  def calculate_progress(location)
    (
      (
        @user
          .user_location_achievements
          .completed(location.achievements)
          .count
          .to_f / location.achievements.count.to_f
      ) * 100
    ).round.to_i
  end
end
