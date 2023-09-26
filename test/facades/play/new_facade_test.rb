require "test_helper"

class Play::NewFacadeTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @facade = Play::NewFacade.new(@user)
  end

  # def test_grouped_final_girl_options
  #   assert_equal(
  #     {
  #       "Series 1" => [final_girls(:one)],
  #       "Series 2" => [final_girls(:two)],
  #       "Custom Final Girls" => [
  #         final_girls(:three),
  #         final_girls(:four)
  #       ],
  #     },
  #     @facade.grouped_final_girl_options
  #   )
  # end

  # def test_final_girls_by_series
  #   assert_equal(
  #     {
  #       "Series 1" => [final_girls(:one)],
  #       "Series 2" => [final_girls(:two)]
  #     },
  #     @facade.send(:final_girls_by_series)
  #   )
  # end

  # def test_custom_final_girls
  #   assert_equal(
  #     {
  #       "Custom Final Girls" => [
  #         final_girls(:three),
  #         final_girls(:four)
  #       ],
  #     },
  #     @facade.send(:custom_final_girls)
  #   )
  # end
end
