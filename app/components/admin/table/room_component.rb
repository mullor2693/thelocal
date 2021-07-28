class Admin::Table::RoomComponent < ViewComponent::Base

  with_collection_parameter :room

  def initialize(room:)
    @room = room
    @id = "admin-room-#{room.id}"
    @title = room&.name
  end

  def call
    content_tag(:tr, id: @id) do 
      content_tag(:td, @title) + render(Admin::Table::Shared::ActionsComponent.new(link: admin_room_path(room), color: "primary"))
    end
  end

  private

  attr_reader :room

  def render?
    room.present?
  end

end