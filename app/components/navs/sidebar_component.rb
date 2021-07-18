class Navs::SidebarComponent < ViewComponent::Base
  def initialize(name:, logo:nil, link:nil, color:nil, background:nil, classes:nil)
    @color = color || "primary"
    @background = background || "white"
    @link = link || "/"
    @name = name 
    @logo = logo || @name&.split&.map(&:first)&.join&.upcase
    @classes = classes || ""
  end

  def call
     content_tag(:div, class: "sidebar #{@classes}", data: {color: @color, background_color: @background} ) do 
       content_tag(:div, class: "logo") do 
         link_to(@logo, @link, class: "simple-text logo-mini") + 
         link_to(@name, @link, class: "simple-text logo-normal") 
       end +
       content_tag(:div, content_tag(:ul, content, class: "nav"), class: "sidebar-wrapper")
    end
  end

end
