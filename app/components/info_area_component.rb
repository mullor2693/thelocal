class InfoAreaComponent < ViewComponent::Base
  def initialize(title:, text:nil, color:nil, icon:nil, link:nil, link_text:nil, horizontal:false)
    @title = title
    @text = text 
    @color = color || 'primary'
    @horizontal = !!horizontal
    @icon = icon || 'chat'
    @link = link
    @link_text = @link.present? (link_text || "Saber Más") : nil
  end

  def call
    content_tag(:div, class: "info#{" info-horizontal" if @horizontal}") do
      content_tag(:div, content_tag(:i, @icon, class: "material-icons"), class: "icon icon-#{@color}") +
      content_tag(:div, class: "description") do
        content_tag(:h4, @title, class: "info-title") +
        (@text.present? ? content_tag(:p, @text) : ''.html_safe) +
        (@link.present? ? link_to(@link_text, @link) : ''.html_safe) 
      end
    end
  end

end
