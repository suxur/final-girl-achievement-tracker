# frozen_string_literal: true

class PageTitleComponent < ApplicationComponent
  def initialize(title:, **options)
    @title = title
    @options = options

    @options[:tag] ||= :h2
    @options[:classes] = class_names(options[:classes], "font-display text-primary text-4xl")
  end

  def call
    render ApplicationComponent.new(**@options) do
      @title
    end
  end
end
