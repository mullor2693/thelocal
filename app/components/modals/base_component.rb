class Modals::BaseComponent < ViewComponent::Base
	def initialize(title:nil, color:nil, color_secondary:nil, save_text:nil, dimiss_text:nil, close:false)
    @title = title
    @save_text = save_text
    @dimiss_text = dimiss_text
    @color = color
    @color_secondary = color_secondary
    @close = close
	end

	def call
    content_tag(:div, class:"modal", tabindex: "-1", role: "dialog" ) do
      content_tag(:div, class: "modal-dialog", role: "document" ) do
        content_tag(:div, class: "modal-content" ) do
          render(Modals::HeaderComponent.new(title: @title)) +
          content_tag(:div, content, class: "modal-body") +
          render(Modals::FooterComponent.new(color: @color, color_secondary: @color_secondary, save_text: @save_text, dimiss_text: @dimiss_text, close: @close))
        end
      end
    end
  end

end

