# frozen_string_literal: true

class CardStatsComponent < ViewComponent::Base
  def initialize(status:, card_icon:, category:, title:, footer_icon:, footer_text:)
    @status = status.in?(ApplicationHelper::GLOBAL_STATUSES) ? status : "none"
    @card_icon = card_icon
    @category = category
    @title = title 
    @footer_icon = footer_icon 
    @footer_text = footer_text
  end

end
