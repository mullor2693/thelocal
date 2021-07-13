class Navs::NavbarComponent < ViewComponent::Base
  def initialize(name:, link_path:nil, hide_toggler:nil)
    @link_path = link_path || "/"
    @name = name
    @hide_toggler = !!hide_toggler
  end

  def call
    content_tag(:nav, class: "navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top") do 
      content_tag(:div, class: "container-fluid") do 
        content_tag(:div, link_to(@name, @link_path, class: "navbar-brand"), class: "navbar-wrapper") +
        unless @hide_toogle
          content_tag(:button, class: "navbar-toggler", data: {toggle:"collapse"}, aria: {controls: "navigation-index" , expanded:"false", label:"Toggle navigation"}) do 
            content_tag(:span, 'Toggle navigation', class: "sr-only") +
            content_tag(:span, '', class: "navbar-toggler-icon icon-bar") +
            content_tag(:span, '', class: "navbar-toggler-icon icon-bar") +
            content_tag(:span, '', class: "navbar-toggler-icon icon-bar")
          end 
        end +
        content_tag(:div, content, class: "collapse navbar-collapse justify-content-end")
      end 
    end
  end

end
