# frozen_string_literal: true

class SeriesController < AuthController
  before_action :authorize_model
  before_action :set_series, only: %i[edit update]

  def index
    @facade = Series::IndexFacade.new current_user, params
  end

  def new
    @series = Series.new
  end

  def create
    @series = Series.create series_params

    if @series.save
      redirect_to series_index_url, notice: "Series was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @series.update series_params
    redirect_to series_path(@series), notice: "Series updated."
  end

  private

  def set_series
    @series = Series.find(params[:id])
    authorize @series
  end

  def series_params
    params.require(:series).permit(:name)
  end
end
