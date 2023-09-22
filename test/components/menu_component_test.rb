# frozen_string_literal: true

require "test_helper"

class MenuComponentTest < ViewComponent::TestCase
  def setup
    @user = users :one
  end

  def test_renders_outer_structure
    render_inline MenuComponent.new(@user)

    assert_selector "nav[data-controller='dropdown']", class: "bg-transparent"
  end

  def test_renders_menu_items
    render_inline MenuComponent.new(@user)

    assert_selector 'div > div > a[href="/dashboard"]'
    assert_selector 'div > div > a[href="/killers"]'
    assert_selector 'div > div > a[href="/locations"]'
    assert_selector 'div > div > a[href="/plays"]'
    assert_selector 'div > div > a[href="/leaderboard"]'
  end
end
