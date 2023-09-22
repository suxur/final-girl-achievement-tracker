# frozen_string_literal: true

class LocationsController < AuthController
  before_action :authorize_model, except: %i[index show]

  def index
    @facade = Location::IndexFacade.new current_user, params
  end

  def show
    @facade = Location::ShowFacade.new current_user, params
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new location_params

    if @location.save
      redirect_to locations_url, notice: "Location was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    location
  end

  def update
    location.update location_params
    redirect_to location_path(location), notice: "Location updated."
  end

  private

  def location
    @location ||= authorize Location.find_by(slug: params[:slug])
  end

  def location_params
    params.require(:location).permit(:name, :slug, :series_id, :icon, :logo)
  end
end
