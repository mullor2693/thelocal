# frozen_string_literal: true

class Forms::InputComponent < ViewComponent::Base
  def initialize(form:, object_attr:, field_type:"text_field", input_value:nil, label:nil)
    @form = form
    @object_attr = object_attr
    @field_type = field_type
    @input_value = input_value
    @label = label
  end

  def call
    content_tag(:div, class: "form-group") do
      @form.label(@object_attr, @label, class: "bmd-label-floating") +
      eval("@form.#{@field_type}(@object_attr, #{@input_value.present? ? "value: @input_value, " : ""}class: 'form-control')") 
    end  
  end

end
