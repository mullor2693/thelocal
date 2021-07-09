class NavItemComponent < ViewComponent::Base
  def initialize(link:, title:, icon:nil, active:false)
    @link = link || root_path
    @title = title
    @icon = icon || "highlight_off"
    @active = active
    @li_class = @active ? "nav-item active" : "nav-item"
  end
end
