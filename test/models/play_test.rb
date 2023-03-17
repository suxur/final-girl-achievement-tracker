require "test_helper"

class PlayTest < ActiveSupport::TestCase
  context "assoctions" do
    should belong_to :user
    should belong_to :final_girl
    should belong_to :killer
    should belong_to :location
  end
end
