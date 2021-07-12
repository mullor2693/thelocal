class Navs::NavbarComponent < ViewComponent::Base
  def initialize(name:, root_path:nil)
    @root_path = root_path || root_path
    @name = name
  end
end
