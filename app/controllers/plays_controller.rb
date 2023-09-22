class PlaysController < AuthController
  def index
    @facade = Play::IndexFacade.new current_user
  end

  def new
    @play = current_user.plays.new(created_at: Time.current)
  end

  def create
    play = current_user.plays.new play_params

    if play.save
      redirect_to plays_url, notice: "Play was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    play
  end

  def update
    if play.update play_params
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
