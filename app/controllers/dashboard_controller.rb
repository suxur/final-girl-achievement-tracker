# frozen_string_literal: true

class DashboardController < AuthController
  def show
    @facade = Dashboard::ShowFacade.new current_user, params
  end
end
