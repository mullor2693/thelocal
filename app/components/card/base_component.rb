class Card::BaseComponent < ViewComponent::Base
  def initialize(title:nil, category:nil, footer_text:nil, footer_icon:nil, color:nil, row_classes:nil, scroll:false, close_button:false, add_button:false)
    @title = title 
    @category = category
    @footer_icon = footer_icon || "list_alt"
    @footer_text = footer_text
    @color = color
    @row_classes = row_classes || "col-lg-6 col-md-12"
    @scroll = !!scroll
    @close_button = !!close_button 
		@add_button = !!add_button
  end

  def call
    content_tag(:div, class: @row_classes) do
      content_tag(:div, class: "card") do 
        (@title.present? ? render(Card::HeaderComponent.new(title: @title, subtitle: @category, color: @color, close_button: @close_button, add_button: @add_button)) : ''.html_safe) +
        content_tag(:div, content, class: "card-body pt-0#{' sroll-body' if @scroll}") +
        (@footer_text.present? ? render(Card::FooterComponent.new(title: @footer_text, icon: @footer_icon)) : ''.html_safe)
      end 
    end
  end


   
 
 

end
