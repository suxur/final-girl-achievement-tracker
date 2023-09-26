require "test_helper"

class SeriesTest < ActiveSupport::TestCase
  context "associations" do
    should have_many :killers
    should have_many :locations
    should have_many :final_girl_series
    should have_many :final_girls
  end

  context "validations" do
    should validate_presence_of :name
  end
end
