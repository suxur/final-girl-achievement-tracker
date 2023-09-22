class Series::IndexFacade < IndexFacade
  def collection
    @collection ||= Series.order(:id)
  end
end
