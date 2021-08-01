class Base::HeaderComponent < Base::StaticComponent
	def initialize(
		style: :default,
		title:nil, 
		subtitle:nil, 
		icon:nil, 
		color:nil,
		data:{}
	)

		style = [:default, :button, :animated, :icon_header].include?(style&.to_sym) ? style.to_sym : :default
		status = ApplicationHelper::GLOBAL_STATUSES.include?(color) ? color : 'primary'

		@title_tag = tag.h4(title, class: 'card-title') if title.present?
		@subtitle_tag = tag.p(subtitle, class: 'card-subtitle') if subtitle.present?
		@classes = "card-header card-header-#{status}"
		@data = data || {}
		@final_tag = @title_tag+@subtitle_tag

		case style
			when :default

			when :button
				@show_button = true
				@classes += ' with-button'
				@button = !!data.try(:[], :button).try(:[], :open) ? Button::OpenComponent.new() : Button::CloseComponent.new()
			when :animated
				@data[:header_animation] = true
			when :icon_header
				@classes += ' card-header-icon'
				@icon = icon || "highlight_off"
				@subtitle_tag = tag.p(subtitle, class: "card-category") if subtitle.present?
				@title_tag = tag.h3(title, class: 'card-title') if title.present?
				@icon_tag = content_tag(:div, content_tag(:i, @icon, class: 'material-icons'), class: 'card-icon')
				@final_tag = @icon_tag+@subtitle_tag+@title_tag
		end
	end

	def call 
		tag.div(class: @classes, data: @data) do
			@final_tag +
			if @show_button 
				render(@button)
			end
		end
	end

end
