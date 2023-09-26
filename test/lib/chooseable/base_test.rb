require "test_helper"

class Chooseable::BaseTest < ActiveSupport::TestCase
  def setup
    @chooseable = Chooseable::Base.new
  end

  def test_items
    assert_raises NotImplementedError do
      @chooseable.items
    end
  end

  def test_id
    assert_raises NotImplementedError do
      @chooseable.id
    end
  end

  def test_prompt
    assert_raises NotImplementedError do
      @chooseable.prompt
    end
  end
end
