# frozen_string_literal: true

class UserFinalGirl::IndexFacade < IndexFacade
  def collection
    user.final_girls
  end
end
