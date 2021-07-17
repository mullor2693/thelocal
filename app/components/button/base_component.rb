class Button::BaseComponent < ViewComponent::Base
	def initialize(title:nil, disabled:nil, color:nil, status:nil, data:nil, style:nil, size:nil)
		# BTN_STYLES = [:default, :round, :fab, :icon, :simple]
		# BTN_SIZE = [:default,:small, :large]
		@style = style || "default"
		@title = title || "title"
		@data = data || {}
		@color = color
    @status = status || (@color.in?(ApplicationHelper::GLOBAL_STATUSES) ? @color : "none")
		@class = "btn btn-#{@status}"
		@class += " btn-fab btn-fab-mini btn-round" if @style == "fab" 
		@class += " btn-round" if (@style == "icon" || @style == "round")
		@class += " btn-sm" if @size == "small"
		@class += " btn-lg" if @size == "large"
		@disabled = !!disabled
	end

	def call
		button_tag(@title, type: 'button', class: @class, disabled: @disabled, data: @data)
	end
end
