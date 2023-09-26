require "test_helper"

class ApplicationPolicyTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  def test_index
    refute_permit(@user, nil, :index)
  end

  def test_show
    refute_permit(@user, nil, :show)
  end

  def test_create
    refute_permit(@user, nil, :create)
  end

  def test_update
    refute_permit(@user, nil, :update)
  end

  def test_destroy
    refute_permit(@user, nil, :destroy)
  end

  def test_scope_class
    assert_raises(NotImplementedError) do
      ApplicationPolicy::Scope.new(@user, nil).resolve
    end
  end
end
