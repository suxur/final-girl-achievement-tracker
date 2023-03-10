class UsersController < AuthController
  def update
    current_user.update!(user_params)
    flash.notice = "Your achievements have been updated."

    redirect_back(fallback_location: root_path)
  end

  def user_params
    params.require(:user).permit(
      { user_killer_achievements_attributes: [:id, :killer_achievement_id, :location_id, :completed] },
      { user_location_achievements_attributes: [:id, :location_achievement_id, :killer_id, :completed] },
    )
  end
end
