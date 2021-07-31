class Card::HeaderComponent < ViewComponent::Base
	def initialize(title:, subtitle:nil, icon:nil, color:nil, icon_header:false, close_button:false, add_button:false)
		@icon_header = !!icon_header
		@status = color.present? && color.in?(ApplicationHelper::GLOBAL_STATUSES) ? color : 'primary'
		@icon = icon || "highlight_off"
		@show_button = (!!close_button || !!add_button)
		@title_tag = content_tag((@icon_header ? :h3 : :h4), title, class: 'card-title') 
		@icon_tag = @icon.present? ? content_tag(:div, content_tag(:i, @icon, class: 'material-icons'), class: 'card-icon') : ''.html_safe
		@subtitle_tag = subtitle.present? ? content_tag(:p, subtitle, class: @icon_header ? "card-category" : 'card-subtitle') : ''.html_safe
		@final_tag = @icon_header ? @icon_tag+@subtitle_tag+@title_tag : @title_tag+@subtitle_tag
		if @show_button
			@button = add_button ? Button::OpenComponent.new() : Button::CloseComponent.new()
			@final_tag = tag.div(@final_tag, class: "col m-auto")
		end
		@classes = "row card-header card-header-#{@status}#{' card-header-icon' if @icon_header}"
	end

	def call 
		tag.div(class: @classes) do
			@final_tag +
			if @show_button 
				tag.div(render(@button), class: "col-auto m-auto") 
			end
		end
	end

end
