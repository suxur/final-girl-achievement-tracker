require "test_helper"

class UserTest < ActiveSupport::TestCase
  context "associations" do
    should have_many :user_killer_achievements
    should have_many :killer_achievements
    should have_many :user_location_achievements
    should have_many :location_achievements
  end

  context "attributes" do
    should accept_nested_attributes_for :user_killer_achievements
    should accept_nested_attributes_for :user_location_achievements
  end
end
