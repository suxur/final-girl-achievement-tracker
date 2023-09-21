require "test_helper"

class IntegrationTest < ActionDispatch::IntegrationTest
  private

  def sign_in_admin
    sign_in users(:one)
  end

  def sign_in_user
    sign_in users(:two)
  end
end
