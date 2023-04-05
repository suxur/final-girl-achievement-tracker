module ApplicationHelper
  include Pagy::Frontend
  ActionView::Base.default_form_builder = TailwindFormBuilder
end
