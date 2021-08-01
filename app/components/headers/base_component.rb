class Headers::BaseComponent < Base::StaticComponent
	def initialize(title:nil, subtitle:nil, icon:nil, color:nil, data:nil)
		status = ApplicationHelper::GLOBAL_STATUSES.include?(color) ? color : 'primary'
		@title_tag = tag.h4(title, class: 'card-title') if title.present?
		@subtitle_tag = tag.p(subtitle, class: 'card-subtitle') if subtitle.present?
		@classes = "card-header card-header-#{status}"
		@data = data || {}
		@final_tag = @title_tag+@subtitle_tag
	end

	def call 
		tag.div(@final_tag, class: @classes, data: @data)
	end

end
