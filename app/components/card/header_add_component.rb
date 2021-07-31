class Card::HeaderAddComponent < ViewComponent::Base
	def initialize(title:, icon:nil, subtitle:nil, color:nil, icon_header:false, open_button:false)
		@title = title
		@subtitle = subtitle
		@color = color
    @status = @color.in?(ApplicationHelper::GLOBAL_STATUSES) ? @color : "none"
		@icon = icon || "highlight_off"
		@icon_header = !!icon_header
		@open_button = !!open_button
	end

	def call 
		content_tag(:div, class: "row card-header card-header-#{@status}#{" card-header-icon" if @icon_header}") do
			tag.div(class: "col m-auto", data: { reveal_target: "item" }) do
				(@icon_header && @icon.present? ? content_tag(:div, content_tag(:i, @icon, class: "material-icons"), class: "card-icon") : ''.html_safe) +
				(@icon_header && @subtitle.present? ? content_tag(:p, @subtitle, class: "card-category") : ''.html_safe) +	
				content_tag((@icon_header ? :h3 : :h4), @title, class: "card-title") +  
				(!@icon_header && @subtitle.present? ? content_tag(:p, @subtitle, class: "card-subtitle") : ''.html_safe)
			end +
			tag.div(render(Button::OpenComponent.new()), class: "col-auto m-auto") 
		end


	end

end