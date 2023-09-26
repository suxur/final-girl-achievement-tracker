require "test_helper"

class AdminPolicyTest < ActiveSupport::TestCase
  setup do
    @admin = users(:one)
    @user = users(:two)
  end

  def test_index
    assert_permit(@admin, nil, :index)
    refute_permit(@user, nil, :index)
  end

  def test_show
    assert_permit(@admin, nil, :show)
    refute_permit(@user, nil, :show)
  end

  def test_create
    assert_permit(@admin, nil, :create)
    refute_permit(@user, nil, :create)
  end

  def test_update
    assert_permit(@admin, nil, :update)
    refute_permit(@user, nil, :update)
  end

  def test_destroy
    assert_permit(@admin, nil, :destroy)
    refute_permit(@user, nil, :destroy)
  end
end
