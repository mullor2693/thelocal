class Card::HeaderComponent < ViewComponent::Base
	def initialize(title:, icon:nil, subtitle:nil, color:nil, edit_link:nil, icon_header:false)
		@title = title
		@subtitle = subtitle
		@color = color
    @status = @color.in?(ApplicationHelper::GLOBAL_STATUSES) ? @color : "none"
		@edit_link = edit_link
		@icon = icon || "highlight_off"
		@icon_header = !!icon_header
	end

	def call 
		content_tag(:div, class: "card-header card-header-#{@status}#{" card-header-icon" if @icon_header}") do
			(@icon_header && @icon.present? ? content_tag(:div, content_tag(:i, @icon, class: "material-icons"), class: "card-icon") : ''.html_safe) +
			(@icon_header && @subtitle.present? ? content_tag(:p, @subtitle, class: "card-category") : ''.html_safe) +	
			content_tag((@icon_header ? :h3 : :h4), @title, class: "card-title") +  
			(!@icon_header && @subtitle.present? ? content_tag(:p, @subtitle, class: "card-subtitle") : ''.html_safe) +
			(!@icon_header && @edit_link.present? ? content_tag(:div, render(Button::SmallComponent.new(link: @edit_link, title: "Editar", icon: "edit", color: "white" )), class: "text-right") : ''.html_safe) 
		end 


	end

end
