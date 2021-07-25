# frozen_string_literal: true

class Forms::FormGroupComponent < ViewComponent::Base
  def initialize(col_class:nil, fg_class:nil)
    @col_class = col_class || "col-md-6"
    @fg_class = fg_class || "form-group"
  end

  def call
    tag.div class: @col_class do
      tag.div class: @fg_class do
        content
      end  
    end
  end

end
