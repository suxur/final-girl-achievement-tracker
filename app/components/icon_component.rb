# frozen_string_literal: true

class IconComponent < ViewComponent::Base
  def initialize(icon, **options)
    @icon = icon
    @classes = options[:class]
  end

  def render?
    @icon.present?
  end

  def classes
    class_names(
      "absolute rounded-full h-12 w-12 flex justify-center items-center border-4 border-zinc-900 bg-zinc-400 group-hover:bg-primary",
      @classes,
    )
  end
end
