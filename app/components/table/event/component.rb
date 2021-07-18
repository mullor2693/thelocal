class Table::Event::Component < ViewComponent::Base

  with_collection_parameter :event

  def initialize(event:)
    @event = event
  end

  def call
    content_tag(:tr, id: "event-#{event.id}") do 
      content_tag(:td, event&.eventable&.title) +
      render(Table::TdActionsComponent.new(link: event_path(event), color: "primary"))
    end
  end

  private

  attr_reader :event

  def render?
    event.present?
  end

end