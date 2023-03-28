class UsersController < AuthController
  def show
  end

  def update
    current_user.update!(user_params)
    flash.notice = "Your changes have been saved."

    redirect_back(fallback_location: root_path)
  end

  def user_params
    params.require(:user).permit(
      :username,
      {
        user_killer_achievements_attributes: %i[
          id
          killer_achievement_id
          location_id
          completed
        ],
      },
      {
        user_location_achievements_attributes: %i[
          id
          location_achievement_id
          killer_id
          completed
        ],
      },
    )
  end
end
