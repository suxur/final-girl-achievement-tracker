class KillersController < AuthController
  def index
    @killers = Killer.all.group_by { |k| k.series.name }
  end

  def show
    @facade = Killer::ShowFacade.new current_user, params
  end
end
