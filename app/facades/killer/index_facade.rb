class Killer::IndexFacade < IndexFacade
  def collection
    killers.group_by(&:series)
  end

  def killers
    @killers ||= Killer.order(:id).map do |killer|
      ProgressCardData::Builder.to_data(killer, user)
    end
  end
end
