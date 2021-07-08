# frozen_string_literal: true

class CardChartComponent < ViewComponent::Base
  def initialize(status:, chart_id:, title:, category:, footer_text:)
    @status = status.in?(ApplicationHelper::STATUSES) ? status : "none"
    @chart_id = chart_id
    @title = title
    @category = category
    @footer_text = footer_text
  end

end
