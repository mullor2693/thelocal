class Admin::Table::Component < ViewComponent::Base
  include ApplicationHelper

  def initialize(items:)
    @items = items
    @model = items&.first&.class&.name
  end

  def call
    content_tag(:table, content_tag(:body, render(eval("Admin::Table::#{@model}::Component.with_collection(@items)"))), class: "table")
  end

  private

  attr_reader :items

  def render?
    @items&.any? && @model&.present?
  end

end