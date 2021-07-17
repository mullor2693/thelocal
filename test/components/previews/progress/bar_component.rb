# localhost:3000/rails/view_components/
class Progress::BarComponentPreview < ViewComponent::Preview

  def base
    render(Progress::BarComponent.new()) 
  end
  
  # progress/bar_component/with_style?
  def with_style()
  end
end


