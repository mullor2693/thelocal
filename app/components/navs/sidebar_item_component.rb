class Navs::SidebarItemComponent < ViewComponent::Base
  def initialize(link:, title:, icon:nil, active:false)
    @link = link || root_path
    @title = title
    @icon = icon || "highlight_off"
    @active = active
    @li_class = @active ? "nav-item navbar-toggler p-0 active" : "nav-item navbar-toggler p-0"
  end

  def call
     tag.li( link_to( (tag.i(@icon, class: "material-icons") + tag.p(@title)).html_safe, @link, class: "nav-link"), class: @li_class)
  end

end
