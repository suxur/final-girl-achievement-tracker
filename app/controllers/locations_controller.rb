class LocationsController < AuthController
  before_action :set_location, only: %i[edit update]

  def index
    @facade = Location::IndexFacade.new current_user, params
  end

  def show
    @facade = Location::ShowFacade.new current_user, params
  end

  def edit
  end

  def update
    @location.update location_params
    redirect_to location_path(@location), notice: "Location updated."
  end

  private

  def set_location
    @location = Location.find_by(slug: params[:slug])
    authorize @location
  end

  def location_params
    params.require(:location).permit(:name, :slug, :series_id, :icon, :logo)
  end
end
