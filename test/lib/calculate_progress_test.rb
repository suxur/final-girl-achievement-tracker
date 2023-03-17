require "test_helper"

class CalculateProgressTest < ActiveSupport::TestCase
  test "calculate progress" do
    completed = Array.new(3)
    total = Array.new(5)
    assert_equal 60, CalculateProgress.new(completed, total).call
  end

  test "calculate progress with zero total" do
    completed = Array.new(3)
    total = []
    assert_equal 0, CalculateProgress.new(completed, total).call
  end

  test "calculate progress with zero completed" do
    completed = []
    total = Array.new(5)
    assert_equal 0, CalculateProgress.new(completed, total).call
  end

  test "calculate progress with zero completed and zero total" do
    completed = []
    total = []
    assert_equal 0, CalculateProgress.new(completed, total).call
  end
end
