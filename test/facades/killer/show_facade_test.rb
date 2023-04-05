require "test_helper"

class Killer::ShowFacadeTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @killer = killers(:one)
    @facade = Killer::ShowFacade.new(@user, params)
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
    assert_equal :user_killer_achievements, @facade.fields_for_type
  end

  def test_achievements
    assert_instance_of KillerAchievement, @facade.achievements.first
  end

  def test_achievement_type
    assert_equal :killer_achievement, @facade.achievement_type
  end

  def test_achievement_type_id
    assert_equal :killer_achievement_id, @facade.achievement_type_id
  end

  def test_has_method
    assert_equal :has_locations, @facade.has_method
  end

  def test_chooseables
    assert_instance_of Array, @facade.chooseables
    assert_equal ["Camp Happy Trails", 980_190_962], @facade.chooseables.first
  end

  def test_chooseable_id
    assert_equal :location_id, @facade.chooseable_id
  end

  def test_chooseable_prompt
    assert_equal "Choose a Location", @facade.chooseable_prompt
  end

  def test_current_achievements
    assert_instance_of(
      UserKillerAchievement,
      @facade.current_achievements.first,
    )
    assert_equal 3, @facade.current_achievements.count
  end

  def test_back_path
    assert_equal [:killers], @facade.back_path
  end

  private

  def params
    { slug: :hans }
  end
end
