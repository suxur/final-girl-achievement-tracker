# frozen_string_literal: true

require "test_helper"

class IconComponentTest < ViewComponent::TestCase
  setup { @killer = killers(:one) }

  def test_component_renders
    render_inline IconComponent.new(@killer.icon)
    assert_selector "div[class='#{classes}'] > img"
  end

  def test_component_does_not_render
    render_inline IconComponent.new(nil)
    refute_selector "div > img"
  end

  def test_component_renders_with_additional_classes
    render_inline IconComponent.new(@killer.icon, class: "w-7")
    assert_selector "div[class='#{classes} w-7'] > img"
  end

  private

  def classes
    "absolute rounded-full h-12 w-12 flex justify-center items-center border-4 border-zinc-900 bg-zinc-400 group-hover:bg-primary"
  end
end
