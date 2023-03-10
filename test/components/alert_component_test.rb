# frozen_string_literal: true

require "test_helper"

class AlertComponentTest < ViewComponent::TestCase
  def setup
    render_inline AlertComponent.new "Achievements updated"
  end

  def test_component_renders_properly
    assert_selector "div", text: "Achievements updated"
  end

  def test_component_renders_button
    assert_selector "button[data-action='alert#close'] > i"
    assert_selector "i.fa-solid.fa-circle-xmark"
  end

  def test_component_has_js_data_properties
    assert_selector "[data-controller='alert']"
    assert_selector "[data-alert-show-class='opacity-100']"
    assert_selector "[data-alert-hide-class='opacity-0']"
    assert_selector "[data-alert-dismiss-after-value='5000']"
  end
end
