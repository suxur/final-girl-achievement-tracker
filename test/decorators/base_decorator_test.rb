require "test_helper"

class BaseDecoratorTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @decorator = BaseDecorator.new(@user)
  end

  def test_original_object
    assert_equal @user, @decorator.original_object
  end

  def test_source_object
    assert_equal @user, @decorator.source_object
  end
end
