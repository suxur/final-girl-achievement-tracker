class PlaysController < AuthController
  def index
    @facade = Play::IndexFacade.new current_user
  end

  def new
    @facade = Play::NewFacade.new current_user
  end

  def create
    @facade = Play::NewFacade.new current_user, play_params

    if @facade.model.save
      redirect_to plays_url, notice: "Play was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @facade = Play::EditFacade.new current_user, params
  end

  def update
    @facade = Play::EditFacade.new current_user, params, strong_params: play_params

    if @facade.model.save
      redirect_to plays_url, notice: "Play was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    play.destroy

    redirect_to plays_url, notice: "Play was successfully destroyed.", status: :see_other
  end

  private

  def play
    @play ||= Play.find(params[:id])
  end

  def play_params
    params.require(:play).permit(
      :final_girl_id,
      :killer_id,
      :location_id,
      :created_at,
      :is_win,
      :extreme_horror_mode
    )
  end
end
