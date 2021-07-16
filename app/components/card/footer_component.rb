class Card::FooterComponent < ViewComponent::Base
	def initialize(title:nil, icon:nil)
		@title = title
		@icon = icon
	end

	def call 
		content_tag(:div, class: "card-footer") do 
			content_tag(:div, class: "stats") do 
				(@icon.present? ? content_tag(:i, @icon, class: "material-icons") : ''.html_safe) +
				(@title.present? ? @title : ''.html_safe)
			end
		end 
	end

end
