class TailwindFormBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Helpers::TagHelper

  def text_field(method, opts = {})
    default_opts = { class: input_classes }
    merged_opts = default_opts.merge(opts)
    super(method, merged_opts)
  end

  def email_field(method, opts = {})
    default_opts = { class: input_classes }
    merged_opts = default_opts.merge(opts)
    super(method, merged_opts)
  end

  def password_field(method, opts = {})
    default_opts = { class: input_classes }
    merged_opts = default_opts.merge(opts)
    super(method, merged_opts)
  end

  def submit(value = nil, opts = {})
    default_opts = { class: button_classes }
    merged_opts = default_opts.merge(opts)
    super(value, merged_opts)
  end

  private

  def input_classes
    "text-zinc-900 mt-1 block w-full rounded-md"
  end

  def button_classes
    class_names(
      "justify-center inline-flex items-center px-4 py-2 border rounded-md font-semibold text-xs uppercase tracking-widest transition ease-in-out duration-150 focus:outline-none disabled:opacity-25",
      "cursor-pointer bg-primary text-white border-transparent hover:bg-red-600 active:bg-red-600",
    )
  end
end
