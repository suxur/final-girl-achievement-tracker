# frozen_string_literal: true

class MenuComponent < ViewComponent::Base
  def initialize(user)
    @user = GravatarDecorator.decorate(user)
  end

  private

  def items
    [
      {name: "Dashboard", path: dashboard_path},
      {name: "Killers", path: killers_path},
      {name: "Locations", path: locations_path},
      {name: "Play Log", path: plays_path},
      {name: "Leaderboard", path: leaderboard_path}
    ]
  end
end
