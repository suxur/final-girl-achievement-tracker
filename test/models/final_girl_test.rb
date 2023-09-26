require "test_helper"

class FinalGirlTest < ActiveSupport::TestCase
  context "associations" do
    should have_one :series
    should have_one :user_final_girl
  end

  context "validations" do
    should validate_presence_of :name
  end
end
