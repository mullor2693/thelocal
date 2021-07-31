class Admin::Table::HomeworkComponent < Base::LiveComponent

  with_collection_parameter :homework

  def initialize(view_context: nil, homework:)
    @homework = homework
    @id = "homework_#{homework.id}"
    @title = homework&.title&.to_s.html_safe
    @color = "primary"

    # these will be used by  LiveComponent to identify
    # the stream channel and the targeted frame-tag on the UI
    @streamable = "homeworks"
    @target = @homework
    super
  end

  def call
    turbo_frame_tag dom_id(@homework), class: "col-md-6" do 
      tag.li(class:"list-group-item") do
        tag.div class: "row" do
      # tag.div class: "card" do
        # tag.div class: "card-body flex" do
          tag.div( tag.span(@title), class: "col align-self-center") + 
          tag.div(class: "col-auto pr-0") do 
            render(Button::SmallComponent.new(link: edit_admin_homework_path(homework), title: "Editar", color: "none", icon: "edit" ))  +
            render(Button::SmallComponent.new(link: admin_homework_path(homework), title: "Ver", icon: "open_in_new", color: @color, data: {turbo: false} )) 
            # render(Button::SmallComponent.new(link: admin_homework_path(homework), title: "Borrar", color: "danger", method: :delete, data: { confirm: '¿Estás seguro?' } ))
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