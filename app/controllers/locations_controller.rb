class LocationsController < AuthController
  def index
    @locations = Location.all.group_by { |l| l.series.name }
  end

  def show
    @facade = Location::ShowFacade.new current_user, params
  end
end
