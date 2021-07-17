class Card::BaseComponent < ViewComponent::Base
  def initialize(title:, category:nil, footer_text:nil, footer_icon:nil, color:nil, row_classes:nil, scroll:false)
    @title = title 
    @category = category
    @footer_icon = footer_icon || "list_alt"
    @footer_text = footer_text
    @color = color
    @row_classes = row_classes || "col-lg-6 col-md-12"
    @scroll = !!scroll
  end

  def call
    content_tag(:div, class: @row_classes) do
      content_tag(:div, class: "card") do 
        render(Card::HeaderComponent.new(title: @title, subtitle: @category, color: @color)) +
        content_tag(:div, content, class: "card-body#{' sroll-body' if @scroll}") +
        render(Card::FooterComponent.new(title: @footer_text, icon: @footer_icon))
      end 
    end
  end


   
 
 

end
