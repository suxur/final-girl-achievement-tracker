require "test_helper"

class Chooseable::KillersTest < ActiveSupport::TestCase
  setup do
    @chooseable = Chooseable::Killers.new
  end

  test "items an array of ids and names" do
  end

  test "it returns the correct id" do
    assert_equal :killer_id, @chooseable.id
  end

  test "it returns the correct prompt" do
    assert_equal "Choose a Killer", @chooseable.prompt
  end
end
