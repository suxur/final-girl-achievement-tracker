require "test_helper"

class ProgressCardData::BuilderTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @record = killers(:one)
    @builder = ProgressCardData::Builder.new(@record, @user)
    @data = @builder.to_data
  end

  def test_to_data
    assert_instance_of ProgressCardData, @builder.to_data
  end

  def test_self_to_data
    assert_instance_of ProgressCardData, ProgressCardData::Builder.to_data(@record, @user)
  end

  def test_data_path
    assert_equal @record, @data.path
  end

  def test_data_series
    assert_equal @record.series.name, @data.series
  end

  def test_data_name
    assert_equal @record.name, @data.name
  end

  def test_data_progress
    assert_equal 67, @data.progress
  end

  def test_data_icon
    assert_equal @record.icon, @data.icon
  end
end
