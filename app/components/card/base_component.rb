class Card::BaseComponent < ViewComponent::Base
  def initialize(title:nil, category:nil, footer_text:nil, footer_icon:nil, color:nil, row_classes:nil, scroll:false, style:nil, data:nil)
    @title = title 
    @category = category
    @footer_icon = footer_icon || "list_alt"
    @footer_text = footer_text
    @color = color
    @row_classes = row_classes || "col-lg-6 col-md-12"
    @scroll = !!scroll
    @style = style
    @data = data

  end

  def call
    content_tag(:div, class: @row_classes) do
      content_tag(:div, class: "card") do 
        (@title.present? ? render(Card::HeaderComponent.new(style: @style, title: @title, subtitle: @category, color: @color, data: @data )) : ''.html_safe) +
        content_tag(:div, content, class: "card-body#{' sroll-body' if @scroll}") +
        (@footer_text.present? ? render(Card::FooterComponent.new(title: @footer_text, icon: @footer_icon)) : ''.html_safe)
      end 
    end
  end


   
 
 

end
