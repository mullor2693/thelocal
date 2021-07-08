# frozen_string_literal: true

class CardTableComponent < ViewComponent::Base
    
    # renders_one :header, "CardHeaderComponent"
    
    def initialize(status:, category:, title:, head_values:[])
        @status = status || "info"
        @category = category
        @title = title 
        @head_values = head_values || []
    end
end
