class Location::IndexFacade < IndexFacade
  def collection
    locations.group_by(&:series)
  end

  def locations
    @locations ||= Location.order(:id).map do |location|
      ProgressCardData::Builder.to_data(location, user)
    end
  end
end
