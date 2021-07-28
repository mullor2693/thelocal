class Modals::HeaderComponent < ViewComponent::Base
	def initialize(title:nil)
		@title = title
	end

	def call
    content_tag(:div, class: "modal-header" ) do
      (@title.present? ? content_tag(:h5, @title, class:"modal-title") : ''.html_safe) +
      content_tag(:button, content_tag(:span, '&times;'.html_safe, aria_hidden: true), type: "button", class: "close", data_dismiss: "modal", aria_label: "Close")
    end
  end

end

