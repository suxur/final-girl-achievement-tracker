class KillersController < AuthController
  def show
    @facade = Killer::ShowFacade.new current_user, params
  end
end
