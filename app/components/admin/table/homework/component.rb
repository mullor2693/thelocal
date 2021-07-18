class Admin::Table::Homework::Component < ViewComponent::Base

  with_collection_parameter :homework

  def initialize(homework:)
    @homework = homework
    @id = "admin-homework-#{homework.id}"
    @title = homework&.title
  end

  def call
    content_tag(:tr, id: @id) do 
      content_tag(:td, @title) + render(Admin::Table::Shared::ActionsComponent.new(link: admin_homework_path(homework), color: "primary"))
    end
  end

  private

  attr_reader :homework

  def render?
    homework.present?
  end

end