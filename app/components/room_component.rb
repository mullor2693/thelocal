class RoomComponent < Base::LiveComponent

  with_collection_parameter :room

  def initialize(view_context: nil, room:, show:true, edit:false, destroy:false)
    # required values
    @room = room
    @id = "room_#{room.id}"
    @title = room&.name&.to_s&.html_safe
    @color = @color || "primary"

    
    @show = !!show
    @edit = !!edit
    @destroy = !!destroy

    # LiveComponent identify
    @streamable = "rooms"
    @target = @room
    super
  end

  def call
    render(Static::CardComponent.new(object: room)) do
      tag.div( tag.span(@title), class: "col align-self-center") + 
      tag.div(class: "col-auto pr-0") do 
        (@edit ? render(Button::SmallComponent.new(link: edit_room_path(room), title: "Editar", color: "none", icon: "edit" ))  : ''.html_safe) +
        (@show ? render(Button::SmallComponent.new(link: room_path(room), title: "Ver", icon: "open_in_new", color: @color, data: {turbo: false} ))  : ''.html_safe) +
        (@destroy ? render(Button::SmallComponent.new(link: room_path(room), title: "Borrar", color: "danger", method: :delete, data: { confirm: '¿Estás seguro?' } )) : ''.html_safe) 
      end 
    end
  end

  private

  attr_reader :room

  def render?
    @room.present?
  end

end