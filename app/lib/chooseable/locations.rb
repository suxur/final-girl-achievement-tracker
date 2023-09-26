class Chooseable::Locations
  def items
    @items ||= Location.chooseables
  end

  def id
    :location_id
  end

  def prompt
    "Choose a Location"
  end
end
