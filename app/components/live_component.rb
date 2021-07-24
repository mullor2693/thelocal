class LiveComponent < ViewComponent::Base
  include ActionView::Context, ActionView::Helpers::TagHelper  
  include Turbo::FramesHelper, Turbo::Streams::StreamName, Turbo::Streams::Broadcasts

  attr_reader :streamable, :target

  def initialize(view_context: nil, **args)
    @view_context = view_context
  end

  def broadcast_replace
    return unless @view_context.present?

    broadcast_replace_later_to(
      streamable,
      target: target,
      content: @view_context.render(self)
    )
  end

  def broadcast_prepend
    return unless @view_context.present?

    broadcast_prepend_to(
      streamable,
      target: broadcast_target_default,
      content: @view_context.render(self)
    )
  end

  def broadcast_remove
    return unless @view_context.present?

    broadcast_remove_to(
      streamable,
      target: target
    )
  end

  private def broadcast_target_default
    target.class.model_name.plural
  end
end