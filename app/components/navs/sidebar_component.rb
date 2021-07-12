class Navs::SidebarComponent < ViewComponent::Base
  def initialize(name:, logo:nil, root_path:nil, color:nil, background:nil)
    @color = color || "primary"
    @background = background || "white"
    @root_path = root_path || root_path
    @name = name 
    @logo = logo || @name&.split&.map(&:first)&.join&.upcase

  end
end
