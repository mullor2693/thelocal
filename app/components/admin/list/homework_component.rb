class Admin::List::HomeworkComponent < LiveComponent

  with_collection_parameter :homework

  def initialize(view_context: nil, homework:, show:true, edit:false, destroy:false)
    @homework = homework
    @id = "admin_homework_#{homework.id}"
    @title = homework&.title&.to_s.html_safe
    @color = "primary"

    @show = !!show
    @edit = !!edit
    @destroy = !!destroy

    # these will be used by  LiveComponent to identify
    # the stream channel and the targeted frame-tag on the UI
    @streamable = "admin_homeworks"
    @target = @homework
    super
  end

  def call
    turbo_frame_tag dom_id(@homework), class: "col-lg-6" do 
      tag.li(class:"list-group-item", id: @id) do
        tag.div class: "row" do
          tag.div( tag.span(@title), class: "col align-self-center") + 
          tag.div(class: "col-auto text-right") do 
            (@edit ? render(Button::SmallComponent.new(link: edit_admin_homework_path(homework), title: "Editar", color: "none", icon: "edit" ))  : ''.html_safe) +
            (@show ? render(Button::SmallComponent.new(link: admin_homework_path(homework), title: "Ver", icon: "open_in_new", color: @color, data: {turbo: false} ))  : ''.html_safe) +
            (@destroy ? render(Button::SmallComponent.new(link: admin_homework_path(homework), title: "Borrar", color: "danger", method: :delete, data: { confirm: '¿Estás seguro?' } )) : ''.html_safe) 
          end 
        end
      end
    end
  end

  private

  attr_reader :homework

  def render?
    @homework.present?
  end

end