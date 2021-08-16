# frozen_string_literal: true

class Forms::FormGroupComponent < ViewComponent::Base
  def initialize(fg_class:nil, fg_data:nil)
    @fg_class = fg_class || "mb-3"
    @fg_data = fg_data || {}
  end

  def call
    tag.div class: @fg_class, data: @fg_data do
      content
    end
  end

end
