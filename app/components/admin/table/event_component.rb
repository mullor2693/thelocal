class Admin::Table::EventComponent < ViewComponent::Base
  include ApplicationHelper

  with_collection_parameter :event

  def initialize(event:)
    @event = event
    @id = "admin-event-#{event.id}"
  end

  def call
    content_tag(:tr, id: @id) do 
      # content_tag(:td, event&.eventable&.title) +
      content_tag(:td, format_date(@event.start_date)) +
      content_tag(:td, format_date(@event.end_date)) +
      render(Admin::Table::Shared::ActionsComponent.new(link: admin_homework_event_path(@event.eventable, @event), color: "primary"))
    end
  end

  private

  attr_reader :event

  def render?
    event.present?
  end

end