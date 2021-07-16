# frozen_string_literal: true

class Layout::FooterComponent < ViewComponent::Base
  def initialize(link:, link_text:, copyright_text:)
    @link = link
    @link_text = link_text
    @copyright_text = copyright_text
  end

  def call
    content_tag(:footer, class: "footer") do 
      content_tag(:div, class: "container-fluid") do 
        content_tag(:nav, content_tag(:ul, content_tag(:li, link_to(@link_text, @link))), class: "float-left") +
        content_tag(:div, @copyright_text, class: "copyright float-right")
      end 
    end 
  end

end
