require "test_helper"

class LocationPolicyTest < ActiveSupport::TestCase
  setup do
    @admin = users(:one)
    @user = users(:two)
    @location = locations(:one)
  end

  def test_index
    assert_permit(@admin, @location, :index)
    assert_permit(@user, @location, :index)
  end

  def test_show
    assert_permit(@admin, @location, :show)
    assert_permit(@user, @location, :show)
  end

  def test_create
    assert_permit(@admin, @location, :create)
    refute_permit(@user, @location, :create)
  end

  def test_update
    assert_permit(@admin, @location, :update)
    refute_permit(@user, @location, :update)
  end

  def test_destroy
    refute_permit(@admin, @location, :destroy)
    refute_permit(@user, @location, :destroy)
  end
end
