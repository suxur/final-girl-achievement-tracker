class UserFinalGirl::EditFacade < EditFacade
  def model
    @final_girl ||= user.final_girls.find_by(id: params[:id]).tap do |final_girl|
      final_girl.assign_attributes strong_params
    end
  end
end
