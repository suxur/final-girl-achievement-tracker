# frozen_string_literal: true

class MenuComponent < ViewComponent::Base
  def initialize(user)
    @user = user
  end

  private

  def menu_items
    items.map do |item|
      item[:class] = menu_item_class(item[:path])
      item
    end
  end

  def menu_item_class(path)
    class_names(
      "font-bold hover:text-zinc-50 rounded-md px-3 py-2 text-sm",
      {
        "bg-primary text-zinc-50 rounded-md px-3 py-2 text-sm" =>
          current_page?(path),
      },
      { "text-zinc-400 hover:bg-zinc-700" => !current_page?(path) },
    )
  end

  def menu_item_mobile_class(path)
    class_names(
      "text-zinc-300 hover:bg-zinc-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium",
      {
        "bg-zinc-900 text-white block rounded-md px-3 py-2 text-base font-medium" =>
          current_page?(path),
      },
    )
  end

  def items
    [
      { name: "Dashboard", path: dashboard_path },
      { name: "Killers", path: killers_path },
      { name: "Locations", path: locations_path },
      { name: "Play Log", path: plays_path },
      { name: "Leaderboard", path: leaderboard_path },
    ]
  end
end
