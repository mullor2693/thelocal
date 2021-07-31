class Admin::List::HomeworkComponent < HomeworkComponent

  def initialize(view_context: nil, homework:, show:true, edit:false, destroy:false)
    @id = "admin_homework_#{homework.id}".freeze
    @streamable = "admin_homeworks".freeze
    super
  end

  def call
    turbo_frame_tag dom_id(@homework), class: "col-lg-6" do 
      tag.li(class:"list-group-item", id: @id) do
        tag.div class: "row" do
          tag.div( tag.span(@title), class: "col align-self-center") + 
          tag.div(class: "col-auto pr-0") do 
            (@edit ? render(Button::SmallComponent.new(link: edit_admin_homework_path(homework), title: "Editar", color: "none", icon: "edit" ))  : ''.html_safe) +
            (@show ? render(Button::SmallComponent.new(link: admin_homework_path(homework), title: "Ver", icon: "open_in_new", color: @color, data: {turbo: false} ))  : ''.html_safe) +
            (@destroy ? render(Button::SmallComponent.new(link: admin_homework_path(homework), title: "Borrar", color: "danger", method: :delete, data: { confirm: '¿Estás seguro?' } )) : ''.html_safe) 
          end 
        end
      end
    end
  end

end