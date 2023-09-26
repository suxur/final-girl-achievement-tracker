require "test_helper"

class LeaderboardStatTest < ActiveSupport::TestCase
  def test_readonly?
    assert LeaderboardStat.new.readonly?
  end
end
