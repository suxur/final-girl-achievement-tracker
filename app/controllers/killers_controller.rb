# frozen_string_literal: true

class KillersController < AuthController
  before_action :authorize_model, except: %i[index show]

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
    @killer = Killer.new killer_params

    if @killer.save
      redirect_to killers_url, notice: "Killer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    killer
  end

  def update
    killer.update killer_params
    redirect_to killer_path(killer), notice: "Killer updated."
  end

  private

  def killer
    @killer ||= authorize Killer.find_by(slug: params[:slug])
  end

  def killer_params
    params.require(:killer).permit(:name, :slug, :series_id, :icon, :logo)
  end
end
