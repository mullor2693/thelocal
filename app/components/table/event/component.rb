class Table::Event::Component < ViewComponent::Base
  include ApplicationHelper
  
  with_collection_parameter :event

  def initialize(event:)
    @event = event
  end

  def call
    content_tag(:tr, id: "event-#{event.id}") do 
      content_tag(:td, format_date(event.start_date)) +
      content_tag(:td, format_date(event.end_date)) +
      render(Table::TdActionsComponent.new(link: event_path(event), color: "primary"))
    end
  end

  private

  attr_reader :event

  def render?
    event.present?
  end

end