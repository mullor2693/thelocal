class Card::HeaderAddComponent < ViewComponent::Base
	def initialize(title:, subtitle:nil, icon:nil, color:nil, edit_link:nil, icon_header:false)
		@icon_header = !!icon_header
		@status = color.present? && color.in?(ApplicationHelper::GLOBAL_STATUSES) ? color : 'primary'
		@icon = icon || "highlight_off"
		
		@title_tag = content_tag((@icon_header ? :h3 : :h4), title, class: 'card-title') 
		@icon_tag = @icon.present? ? content_tag(:div, content_tag(:i, @icon, class: 'material-icons'), class: 'card-icon') : ''.html_safe
		@subtitle_tag = subtitle.present? ? content_tag(:p, subtitle, class: @icon_header ? "card-category" : 'card-subtitle') : ''.html_safe
	
		@final_tag = @icon_header ? @icon_tag+@subtitle_tag+@title_tag : @title_tag+@subtitle_tag
		@classes = "row card-header card-header-#{@status}#{' card-header-icon' if @icon_header}"
	end

	def call 
		tag.div(class: @classes) do
			tag.div(@final_tag, class: "col m-auto") +
			tag.div(render(Button::CloseComponent.new()), class: "col-auto m-auto") 
		end
	end

end

