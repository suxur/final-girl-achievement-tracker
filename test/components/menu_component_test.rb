# frozen_string_literal: true

require "test_helper"

class MenuComponentTest < ViewComponent::TestCase
  def test_renders_outer_structure
    render_inline MenuComponent.new active: nil

    assert_selector 'div[class="flex justify-center items-center mb-8 sm:mb-4"]'
    assert_selector 'div > div[class="flex flex-row"]'
  end

  def test_renders_menu_items
    render_inline MenuComponent.new active: nil

    assert_selector 'div > div > a[href="/killers"]'
    assert_selector 'div > div > a[href="/locations"]'
    assert_selector 'div > div > a[href="/plays"]'
  end

  def test_renders_active_item
    render_inline MenuComponent.new active: "/killers"

    assert_selector "div > div > a[href='/killers'][class='#{default_classes} text-primary hover:text-red-700']"
    refute_selector "div > div > a[href='/killers'][class='#{default_classes} text-zinc-600 hover:text-zinc-700']"
  end

  private

  def default_classes
    "font-display text-3xl sm:text-4xl border-r pr-4 mr-4 last:border-r-0 border-zinc-600 last:pr-0 last:mr-0"
  end
end
