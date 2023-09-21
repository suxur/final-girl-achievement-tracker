class KillersController < AuthController
  before_action :set_killer, only: %i[edit update]

  def index
    @facade = Killer::IndexFacade.new current_user, params
  end

  def show
    @facade = Killer::ShowFacade.new current_user, params
  end

  def new
    @killer = Killer.new
  end

  def create
    @killer = Killer.new(killer_params)

    if @killer.save
      redirect_to killers_url, notice: "Killer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @killer.update killer_params
    redirect_to killer_path(@killer), notice: "Killer updated."
  end

  private

  def set_killer
    @killer = Killer.find_by(slug: params[:slug])
    authorize @killer
  end

  def killer_params
    params.require(:killer).permit(:name, :slug, :series_id, :icon, :logo)
  end
end
