class Table::Homework::Component < ViewComponent::Base

  with_collection_parameter :homework

  def initialize(homework:, admin:false)
    @homework = homework
    @link = admin ? admin_homework_path(homework) : homework_path(homework)
    @id = "#{'admin-' if admin}homework-#{homework.id}"
  end

  def call
    content_tag(:tr, id: @id) do 
      content_tag(:td, homework&.title) +
      render(Table::TdActionsComponent.new(link: @link, color: "primary"))
    end
  end

  private

  attr_reader :homework

  def render?
    homework.present?
  end

end