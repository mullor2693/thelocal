class Navs::SidebarItemComponent < ViewComponent::Base
  def initialize(link:, title:, icon:nil, active:false)
    @link = link || root_path
    @title = title
    @icon = icon || "highlight_off"
    @active = active
    @li_class = @active ? "nav-item active" : "nav-item"
  end

  def call
     content_tag(:li, class: @li_class) do 
       link_to(@link, class: "nav-link") do 
         content_tag(:i, @icon, class: "material-icons") + content_tag(:p, @title) 
       end 
     end 
  end

end
