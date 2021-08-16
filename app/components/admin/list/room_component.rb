class Admin::List::RoomComponent < RoomComponent

  def initialize(view_context: nil, room:, show:true, edit:false, destroy:false)
    @id = "admin_room_#{room.id}".freeze
    @streamable = "admin_rooms".freeze
    super
  end

  def call
    turbo_frame_tag @id, class: "list-group-item d-flex justify-content-between" do   
      tag.div(@title, class: "align-self-center") + 
      tag.div() do 
        (@edit ? link_to('<i class="material-icons">open_in_new</i>'.html_safe, edit_admin_room_path(room), class: "align-self-center", data: {turbo: false}) : ''.html_safe) +
        (@show ? link_to('<i class="material-icons">open_in_new</i>'.html_safe, admin_room_path(room), class: "align-self-center", data: {turbo: false})  : ''.html_safe) +
        (@destroy ? link_to('<i class="material-icons">delete</i>'.html_safe, admin_room_path(room), method: :delete, class: "align-self-center") : ''.html_safe) 
      end 
    end
  end

end