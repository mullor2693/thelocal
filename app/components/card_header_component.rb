# frozen_string_literal: true

class CardHeaderComponent < ViewComponent::Base
    def initialize(status:, title:, subtitle:)
        @status = status || 'info'
        @title = title
        @subtitle = subtitle
    end

    def call
        content_tag(:div, class: "card-header card-header-#{@status}") do
            content_tag(:h4, @title, class: "card-title") if @title.present?
            content_tag(:p, @subtitle, class: "card-category") if @subtitle.present?
        end 
    end
end
