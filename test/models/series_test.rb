require "test_helper"

class SeriesTest < ActiveSupport::TestCase
  context "associations" do
    should have_many :killers
    should have_many :locations
    should have_many :final_girls
  end
end
