# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  def initialize(message)
    @message = message
  end

  private

  def js_data
    {
      controller: :alert,
      alert_show_class: "opacity-100",
      alert_hide_class: "opacity-0",
      alert_dismiss_after_value: 5000,
    }
  end
end
