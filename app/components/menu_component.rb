# frozen_string_literal: true

class MenuComponent < ViewComponent::Base
  def initialize(active:)
    @active = active
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
      "font-display text-4xl border-r pr-4 mr-4 last:border-r-0 border-zinc-600 last:pr-0 last:mr-0",
      { "text-primary hover:text-red-700" => is_active?(path) },
      { "text-zinc-600 hover:text-zinc-700" => !is_active?(path) },
    )
  end

  def items
    [
      { name: "Killers", path: killers_path },
      { name: "Locations", path: locations_path },
      { name: "Play Log", path: plays_path },
    ]
  end

  def is_active?(path)
    @active == path
  end
end
