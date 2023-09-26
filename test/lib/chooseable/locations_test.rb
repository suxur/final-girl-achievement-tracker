require "test_helper"

class Chooseable::LocationsTest < ActiveSupport::TestCase
  setup do
    @chooseable = Chooseable::Locations.new
  end

  test "items an array of ids and names" do
    assert_equal(
      [
        [locations(:one).name, locations(:one).id],
        [locations(:two).name, locations(:two).id]
      ],
      @chooseable.items
    )
  end

  test "it returns the correct id" do
    assert_equal :location_id, @chooseable.id
  end

  test "it returns the correct prompt" do
    assert_equal "Choose a Location", @chooseable.prompt
  end
end
