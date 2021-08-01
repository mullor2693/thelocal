class Card::StatsComponent < ViewComponent::Base
  def initialize(title:, link:nil, category:nil, footer_text:nil, card_icon:nil, footer_icon:nil, color:nil, row_classes:nil)
    @title = title 
    @link = link
    @category = category
    @card_icon = card_icon || "highlight_off"
    @footer_icon = footer_icon || "list_alt"
    @footer_text = footer_text
    @color = color
    @status = @color.in?(ApplicationHelper::GLOBAL_STATUSES) ? @color : "none"
    @row_classes = row_classes || "col-lg-6 col-md-12"
  end

  def call
    content_tag(:div, class: @row_classes) do
      if @link.present?
        link_to @link do
          content_tag(:div, class: "card card-stats") do 
            render(Headers::WithIconComponent.new(title: @title, icon: @card_icon, subtitle: @category, color: @color)) +
            render(Card::FooterComponent.new(title: @footer_text, icon: @footer_icon))
          end 
        end
      else
        content_tag(:div, class: "card card-stats") do 
          render(Headers::WithIconComponent.new(title: @title, icon: @card_icon, subtitle: @category, color: @color)) +
          render(Card::FooterComponent.new(title: @footer_text, icon: @footer_icon))
        end
      end
    end
  end

end
