# frozen_string_literal: true

class Forms::GroupComponent < ViewComponent::Base
  def initialize(label:nil, col_class:nil, fg_class:nil, col_data:nil, fg_data:nil, float: true)
    @col_class = col_class || "col-md-6"
    @col_data = col_data || {}
    @fg_class = fg_class || "form-group"
    @fg_data = fg_data || {}
    @float = !!float
    @label_for = label.try(:[], :for)
    @span_tag = @float && label.try(:[], :title).present? ? tag.span(label[:title]) : ''.html_safe
    @label_class = label.try(:[], :class)
    @label_tag = !@float && label.try(:[], :title).present? ? tag.label(label[:title], for: @label_for, class: @label_class) : ''.html_safe
  end

  def call
    tag.div class: @col_class, data: @col_data do
      tag.div class: @fg_class do
        @float ? tag.label(content + @span_tag, class:"w-100", for: @label_for) : (@label_tag + content).html_safe
      end  
    end
  end

end
