# frozen_string_literal: true

class Forms::FormGroupComponent < ViewComponent::Base
  def initialize(col_class:nil, fg_class:nil, col_data:nil, fg_data:nil)
    @col_class = col_class || "col-md-6"
    @col_data = col_data || {}
    @fg_class = fg_class || "form-group"
    @fg_data = fg_data || {}
  end

  def call
    tag.div class: @col_class, data: @col_data do
      tag.div class: @fg_class do
        content
      end  
    end
  end

end
