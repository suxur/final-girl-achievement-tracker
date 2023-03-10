# frozen_string_literal: true

require "test_helper"

class ProgressCardComponentTest < ViewComponent::TestCase
  def setup
    render_inline(
      ProgressCardComponent.new(
        title: "Hans",
        progress: 50,
        icon: "/hans_icon",
      ),
    )
  end

  def test_component_renders_icon
    assert_selector "img[src='/hans_icon']"
  end

  def test_component_renders_title
    assert_selector "p", text: "Hans"
  end

  def test_component_renders_progress
    assert_selector "p", text: "Progress"
    assert_selector "p", text: "50%"
  end

  def test_component_renders_progress_bar
    assert_selector "div[style='width: 50%']"
  end
end
