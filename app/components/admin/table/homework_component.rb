class Admin::Table::HomeworkComponent < LiveComponent

  with_collection_parameter :homework

  def initialize(view_context: nil, homework:)
    @homework = homework
    @id = "homework_#{homework.id}"
    @title = homework&.title
    @color = "primary"

    # these will be used by  LiveComponent to identify
    # the stream channel and the targeted frame-tag on the UI
    @streamable = "homeworks"
    @target = @homework
    super
  end

  def call
    turbo_frame_tag dom_id(@homework) do 
      tag.li(class:"list-group-item") do
        tag.p(@title, class:"card-text") + render(Admin::Table::Shared::ActionsComponent.new(link: admin_homework_path(homework), color: @color))
      end
    end
  end

  private

  attr_reader :homework

  def render?
    @homework.present?
  end

end