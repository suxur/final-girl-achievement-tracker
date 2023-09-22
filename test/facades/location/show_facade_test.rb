require "test_helper"

class Location::ShowFacadeTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @location = locations(:one)
    @facade = Location::ShowFacade.new(@user, params)
  end

  def test_icon_path
    assert_instance_of ActiveStorage::Attached::One, @facade.icon_path
  end

  def test_logo_path
    assert_instance_of ActiveStorage::Attached::One, @facade.logo_path
  end

  def test_has_logo?
    assert_equal false, @facade.has_logo?
  end

  def test_fields_for_type
    assert_equal :user_location_achievements, @facade.fields_for_type
  end

  def test_achievements
    assert_instance_of LocationAchievement, @facade.achievements.first
  end

  def test_achievement_type
    assert_equal :location_achievement, @facade.achievement_type
  end

  def test_achievement_type_id
    assert_equal :location_achievement_id, @facade.achievement_type_id
  end

  def test_has_method
    assert_equal :has_killers, @facade.has_method
  end

  def test_chooseable
    assert_instance_of Chooseable::Killers, @facade.chooseable
  end

  def test_current_achievements
    assert_instance_of(
      UserLocationAchievement,
      @facade.current_achievements.first
    )
    assert_equal 3, @facade.current_achievements.count
  end

  def test_back_path
    assert_equal [:locations], @facade.back_path
  end

  private

  def params
    {slug: :camp_happy_trails}
  end
end
