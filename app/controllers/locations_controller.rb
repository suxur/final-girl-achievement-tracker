class LocationsController < AuthController
  def show
    @facade = Location::ShowFacade.new current_user, params
  end
end
