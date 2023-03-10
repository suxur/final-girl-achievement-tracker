class HomeController < AuthController
  def show
    @killers = Killer.all
    @locations = Location.all
  end
end
