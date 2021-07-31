# frozen_string_literal: true

class Layout::FooterComponent < ViewComponent::Base
  def initialize(link:nil, link_text:nil, copyright_text:nil)
    @link = link
    @link_text = link_text
    @copyright_text = copyright_text
  end

  def call
    content_tag(:footer, class: "footer") do 
      content_tag(:div, class: "container-fluid") do 
        (@link.present? ? content_tag(:nav, content_tag(:ul, content_tag(:li, link_to(@link_text, @link))), class: "float-left") : ''.html_safe) +
        (@copyright_text.present? ? content_tag(:div, @copyright_text, class: "copyright float-right") : ''.html_safe)
      end 
    end 
  end

end
