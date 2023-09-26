module ApplicationHelper
  include Pagy::Frontend
  ActionView::Base.default_form_builder = TailwindFormBuilder

  def render_component(component_path, collection: nil, **, &block)
    component_klass = "#{component_path.classify}Component".constantize

    if collection
      render component_klass.with_collection(collection, **), &block
    else
      render component_klass.new(**), &block
    end
  end
end
