class Homeworks::BaseComponent < Base::LiveComponent

  with_collection_parameter :homework

  def initialize(view_context: nil, homework:, show:true, edit:false, destroy:false)
    # required values
    @homework = homework
    @id = "homework_#{homework.id}"
    @title = homework&.title&.to_s.html_safe
    @color = @color || "primary"

    
    @show = !!show
    @edit = !!edit
    @destroy = !!destroy

    # LiveComponent identify
    @streamable = "homeworks"
    @target = @homework
    super
  end

  def call
    render(Static::CardComponent.new(object: homework)) do
      tag.div( tag.span(@title), class: "col align-self-center") + 
      tag.div(class: "col-auto pr-0") do 
        (@edit ? render(Button::SmallComponent.new(link: edit_homework_path(homework), title: "Editar", color: "none", icon: "edit" ))  : ''.html_safe) +
        (@show ? render(Button::SmallComponent.new(link: homework_path(homework), title: "Ver", icon: "open_in_new", color: @color, data: {turbo: false} ))  : ''.html_safe) +
        (@destroy ? render(Button::SmallComponent.new(link: homework_path(homework), title: "Borrar", color: "danger", method: :delete, data: { confirm: '¿Estás seguro?' } )) : ''.html_safe) 
      end 
    end
  end

  private

  attr_reader :homework

  def render?
    @homework.present?
  end

end