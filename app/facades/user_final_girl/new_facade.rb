# frozen_string_literal: true

class UserFinalGirl::NewFacade < NewFacade
  def model
    user.final_girls.new.tap do |final_girl|
      final_girl.assign_attributes strong_params
    end
  end
end
