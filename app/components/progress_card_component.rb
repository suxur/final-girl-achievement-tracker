# frozen_string_literal: true

class ProgressCardComponent < ViewComponent::Base
  def initialize(title:, progress:, icon:)
    @title = title
    @progress = progress
    @icon = icon
  end
end
