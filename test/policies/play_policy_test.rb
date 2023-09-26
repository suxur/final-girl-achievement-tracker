require "test_helper"

class PlayPolicyTest < ActiveSupport::TestCase
  def test_policy_scoe
    assert_equal 2, PlayPolicy::Scope.new(users(:one), Play).resolve.count
    assert_equal 1, PlayPolicy::Scope.new(users(:two), Play).resolve.count
  end
end
