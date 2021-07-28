# localhost:3000/rails/view_components/
class Forms::InputComponentPreview < ViewComponent::Preview

  def base
    render(Forms::InputComponent.new(form: nil, object_attr: nil)) 
	end

  # forms/input_component/with_style?
  def with_style()
  end

end