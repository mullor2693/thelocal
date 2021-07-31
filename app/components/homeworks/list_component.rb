class Homeworks::ListComponent < Homeworks::BaseComponent

  def initialize(view_context: nil, homework:, show:true, edit:false, destroy:false)
    @id = "homework_#{homework.id}".freeze
    @streamable = "homeworks".freeze
    @edit_link = edit_homework_path(homework)
    @show_link = @destroy_link = homework_path(homework)
    super
  end

  def call
    turbo_frame_tag dom_id(@homework), class: "col-lg-6" do 
      tag.li(class:"list-group-item", id: @id) do
        tag.div class: "row" do
          tag.div( tag.span(@title), class: "col align-self-center") + 
          tag.div(class: "col-auto text-right align-self-center") do 
            (@edit ? render(Button::SmallComponent.new(link: @edit_link, title: "Editar", color: "none", icon: "edit" ))  : ''.html_safe) +
            (@show ? render(Button::SmallComponent.new(link: @show_link, title: "Ver", icon: "open_in_new", color: @color, data: {turbo: false} ))  : ''.html_safe) +
            (@destroy ? render(Button::SmallComponent.new(link: @destroy_link, title: "Borrar", color: "danger", method: :delete, data: { confirm: '¿Estás seguro?' } )) : ''.html_safe) 
          end 
        end
      end
    end
  end

end