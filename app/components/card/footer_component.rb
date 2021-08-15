class Card::FooterComponent < ViewComponent::Base
	def initialize(title:nil, icon:nil)
		@title = title
		@icon = icon
	end

	def call 
		content_tag(:div, class: "card-footer d-flex") do 
			(@icon.present? ? content_tag(:i, @icon, class: 'material-icons mr-2') : ''.html_safe) +
			(@title.present? ? tag.div(@title, class: 'align-self-center') : ''.html_safe)
		end
	end

end
