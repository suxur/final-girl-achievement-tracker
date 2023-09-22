# frozen_string_literal: true

class MenuItemComponent < ApplicationComponent
  with_collection_parameter :menu_item

  def initialize(menu_item:)
    @menu_item = menu_item
  end

  private

  def classes
    class_names(
      "font-bold hover:text-zinc-50 rounded-md px-3 py-2 text-sm",
      {
        "bg-primary text-zinc-50 rounded-md px-3 py-2 text-sm" => is_current_page?
      },
      {"text-zinc-400 hover:bg-zinc-700" => !is_current_page?}
    )
  end

  def mobile_classes
    class_names(
      "text-zinc-300 hover:bg-zinc-700 hover:text-white block rounded-md px-3 py-2 text-base font-medium",
      {
        "bg-zinc-900 text-white block rounded-md px-3 py-2 text-base font-medium" => is_current_page?
      }
    )
  end

  private

  def is_current_page?
    @is_current_page ||= current_page?(@menu_item[:path])
  end
end
