class Series::IndexFacade < IndexFacade
  def collection
    Series.order(:id)
  end
end
