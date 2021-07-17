# localhost:3000/rails/view_components/
class Modals::BaseComponentPreview < ViewComponent::Preview

  def base
    render(Modals::BaseComponent.new()) 
  end
  
  # modals/base_component/with_style?
  def with_style()
  end
end


