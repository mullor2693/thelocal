class Card::HeaderComponent < ViewComponent::Base
	def initialize(title:, subtitle:nil, color:nil, edit_link:nil)
		@title = title
		@subtitle = subtitle
		@color = color
    @status = @color.in?(ApplicationHelper::GLOBAL_STATUSES) ? @color : "none"
		@edit_link = edit_link
	end

	def call
		content_tag(:div, class: "card-header card-header-#{@status}") do
			content_tag(:h4, @title, class: "card-title") +  
			if @subtitle.present? 
				content_tag(:p, @subtitle, class: "card-subtitle")	
			end +
			if @edit_link.present? 
				content_tag(:div, render(Button::SmallComponent.new(link: @edit_link, title: "Editar", icon: "edit", color: "white" )), class: "text-right") 
			end 
		end 
	end

end
