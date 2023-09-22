# frozen_string_literal: true

class IconComponent < ApplicationComponent
  def initialize(icon, **options)
    @icon = icon
    @options = options

    @options[:tag] ||= :div
    @options[:class] = class_names options[:class], default_classes
  end

  def call
    render ApplicationComponent.new(**@options) do
      image_tag @icon, class: "h-7"
    end
  end

  def render?
    @icon.present?
  end

  private

  def default_classes
    "absolute rounded-full h-12 w-12 flex justify-center items-center border-4 border-zinc-900 bg-zinc-400 group-hover:bg-primary"
  end
end
