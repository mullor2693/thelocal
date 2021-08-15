class Admin::List::HomeworkComponent < HomeworkComponent

  def initialize(view_context: nil, homework:, show:true, edit:false, destroy:false)
    @id = "admin_homework_#{homework.id}".freeze
    @streamable = "admin_homeworks".freeze
    super
  end

  def call
    turbo_frame_tag @id, class: "list-group-item d-flex justify-content-between" do   
      tag.div(@title, class: "align-self-center") + 
      tag.div() do 
        (@edit ? link_to('<i class="material-icons">open_in_new</i>'.html_safe, edit_admin_homework_path(homework), class: "align-self-center", data: {turbo: false}) : ''.html_safe) +
        (@show ? link_to('<i class="material-icons">open_in_new</i>'.html_safe, admin_homework_path(homework), class: "align-self-center", data: {turbo: false})  : ''.html_safe) +
        (@destroy ? link_to('<i class="material-icons">delete</i>'.html_safe, admin_homework_path(homework), method: :delete, class: "align-self-center") : ''.html_safe) 
      end 
    end
  end

end