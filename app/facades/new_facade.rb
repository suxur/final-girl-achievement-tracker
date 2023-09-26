# frozen_string_literal: true

class NewFacade
  attr_reader :user, :params, :strong_params

  def initialize(user, params = {}, **options)
    @user = user
    @params = params
    @strong_params = options[:strong_params] || {}
  end
end
