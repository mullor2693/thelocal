class Admin::Table::Shared::ElementComponent < ViewComponent::Base

  with_collection_parameter :element

  def initialize(element:)
    @element = element
    @model = element&.class&.name
    @id = "admin-#{@model&.downcase}-#{element.id}"
    @text = element&.get_content
  end

  def call
    content_tag(:tr, id: @id) do 
      content_tag(:td, @text) + render(Admin::Table::Shared::ActionsComponent.new(link: admin_element_path(element), color: "primary"))
    end
  end

  private

  attr_reader :element

  def render?
    element.present?
  end

end