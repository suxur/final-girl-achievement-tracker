class PlaysController < AuthController
  before_action :set_play, only: %i[show edit update destroy]

  def index
    @plays =
      Play
        .joins(:final_girl, :killer, :location)
        .where(user_id: current_user.id)
        .order(created_at: :desc)
  end

  def new
    @play = current_user.plays.new
  end

  def create
    @play = current_user.plays.new(play_params)

    if @play.save
      redirect_to plays_url, notice: "Play was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @play.destroy

    redirect_to plays_url, notice: "Play was successfully destroyed."
  end

  private

  def set_play
    @play = Play.find(params[:id])
  end

  def play_params
    params.require(:play).permit(
      :final_girl_id,
      :killer_id,
      :location_id,
      :is_win,
    )
  end
end
