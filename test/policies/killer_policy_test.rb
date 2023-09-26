require "test_helper"

class KillerPolicyTest < ActiveSupport::TestCase
  setup do
    @admin = users(:one)
    @user = users(:two)
    @killer = killers(:one)
  end

  def test_index
    assert_permit(@admin, @killer, :index)
    assert_permit(@user, @killer, :index)
  end

  def test_show
    assert_permit(@admin, @killer, :show)
    assert_permit(@user, @killer, :show)
  end

  def test_create
    assert_permit(@admin, @killer, :create)
    refute_permit(@user, @killer, :create)
  end

  def test_update
    assert_permit(@admin, @killer, :update)
    refute_permit(@user, @killer, :update)
  end

  def test_destroy
    refute_permit(@admin, @killer, :destroy)
    refute_permit(@user, @killer, :destroy)
  end
end
