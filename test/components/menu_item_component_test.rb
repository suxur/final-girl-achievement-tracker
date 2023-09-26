# frozen_string_literal: true

require "test_helper"

class MenuItemComponentTest < ViewComponent::TestCase
  def setup
    @component = MenuItemComponent.new(menu_item: {name: "Home", path: "/"})
  end

  def test_component_renders
    render_inline @component
    assert_selector "a", text: "Home"
  end
end
