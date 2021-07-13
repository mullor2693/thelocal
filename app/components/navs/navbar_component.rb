class Navs::NavbarComponent < ViewComponent::Base
  def initialize(name:, root_path:nil)
    @root_path = root_path || root_path
    @name = name
  end

  def call
    content_tag(:nav, class: "navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top") do 
      content_tag(:div, class: "container-fluid") do 
        content_tag(:div, link_to(@name, @root_path, class: "navbar-brand"), class: "navbar-wrapper")
        content_tag(:button, class: "navbar-toggler", data: {toggle:"collapse"}, aria: {controls: "navigation-index" , expanded:"false", label:"Toggle navigation"}) do 
          content_tag(:span, 'Toggle navigation', class: "sr-only") 
          content_tag(:span, '', class: "navbar-toggler-icon icon-bar") 
          content_tag(:span, '', class: "navbar-toggler-icon icon-bar") 
          content_tag(:span, '', class: "navbar-toggler-icon icon-bar") 
        end 
        content_tag(:div, class: "collapse navbar-collapse justify-content-end") do 
          content 
        end 
      end 
    end
  end

end
