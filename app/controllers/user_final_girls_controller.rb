class UserFinalGirlsController < AuthController
  def index
    @facade = UserFinalGirl::IndexFacade.new current_user
  end

  def new
    @facade = UserFinalGirl::NewFacade.new current_user
  end

  def create
    @facade = UserFinalGirl::NewFacade.new current_user, params, strong_params: strong_params
    if @facade.model.save
      redirect_to user_final_girls_url, notice: "Final Girl was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @facade = UserFinalGirl::EditFacade.new current_user, params
  end

  def update
    @facade = UserFinalGirl::EditFacade.new current_user, params, strong_params: strong_params
    if @facade.model.save
      redirect_to user_final_girls_url, notice: "Final Girl was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    final_girl.destroy
    redirect_to user_final_girls_url, notice: "Final Girl was successfully destroyed.", status: :see_other
  end

  private

  def final_girl
    @final_girl = current_user.final_girls.find_by(id: params[:id])
  end

  def final_girl_params
    params.require(:final_girl).permit(:name)
  end

  def strong_params
    {
      name: final_girl_params[:name],
      slug: final_girl_params[:name].parameterize
    }
  end
end
