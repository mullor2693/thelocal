class CardStatsComponent < ViewComponent::Base
  def initialize(title:, category:, footer_text:, card_icon:nil, footer_icon:nil, color:nil)
    @title = title 
    @category = category
    @card_icon = card_icon || "highlight_off"
    @footer_icon = footer_icon || "list_alt"
    @footer_text = footer_text
    @color = color
    @status = @color.in?(ApplicationHelper::GLOBAL_STATUSES) ? @color : "none"
  end

end
