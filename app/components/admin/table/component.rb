class Admin::Table::Component < LiveComponent
  include ApplicationHelper

  def initialize(items:)
    @items = items
    @model = items&.first&.class&.model_name
  end

  def call
    content_tag(:table, class: "table") do
      content_tag(:body) do
        turbo_frame_tag @model.plural do 
          render(eval("Admin::Table::#{@model.name}Component.with_collection(@items)"))
        end
      end
    end
  end

  private

  attr_reader :items

  def render?
    @items&.any? && @model&.present?
  end

end