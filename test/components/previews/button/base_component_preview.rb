# localhost:3000/rails/view_components/
class Button::BaseComponentPreview < ViewComponent::Preview
  
	def base
    render(Button::BaseComponent.new()) 
	end

  # button/base_component/with_style?style=:round&size=:small
	# BTN_STYLES = [:default, :round, :fab, :icon, :simple]
	# BTN_SIZE = [:default,:small, :large]
  def with_style(style:nil, size:nil)
    render(Button::BaseComponent.new(
			title: "Test Button", 
			style: style, 
			size: size
		))
  end

end
 