class AuthController < ApplicationController
  layout "authenticated"

  before_action :authenticate_user!
end
