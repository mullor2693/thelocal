# localhost:3000/rails/view_components/
class Layout::FooterComponentPreview < ViewComponent::Preview

  def base
    render(Layout::FooterComponent.new()) 
	end
  
  # Layout/footer_component/with_style?
  def with_style()
  end
end
