require "test_helper"

class CalculateProgressTest < ActiveSupport::TestCase
  test "calculate progress" do
    assert_equal 60, CalculateProgress.new(3, 5).call
  end

  test "calculate progress with zero total" do
    assert_equal 0, CalculateProgress.new(3, 0).call
  end

  test "calculate progress with zero completed" do
    assert_equal 0, CalculateProgress.new(0, 5).call
  end

  test "calculate progress with zero completed and zero total" do
    assert_equal 0, CalculateProgress.new(0, 0).call
  end
end
