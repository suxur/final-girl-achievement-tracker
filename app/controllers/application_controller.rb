class ApplicationController < ActionController::Base
  layout :layout_by_resource

  def layout_by_resource
    return "devise" if devise_controller?
    "application"
  end
end
