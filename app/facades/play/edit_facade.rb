class Play::EditFacade < EditFacade
  def model
    @play ||= Play.find(params[:id]).tap do |play|
      play.assign_attributes strong_params
    end
  end

  def series
    Series.order(:name)
  end

  def grouped_final_girl_options
    custom_final_girls.merge(final_girls_by_series).map do |series_name, final_girls|
      [series_name, final_girls.map { |fg| [fg.name, fg.id] }]
    end
  end

  private

  def final_girls_by_series
    @final_girls_by_series ||= FinalGirl.joins(:series).order(:name).group_by { |fg| fg.series.name }
  end

  def custom_final_girls
    @custom_final_girls ||= {"Custom Final Girls" => user.final_girls.to_a}
  end
end
