class Button::SmallComponent < ViewComponent::Base
	def initialize(link:, title:nil, icon:nil, color:nil, method:nil, data:nil)
		@link = link
		@title = title || "content"
		@icon = icon || "close"
		@color = color
		@method = method || :get
		@data = data || {}
    @status = @color.in?(ApplicationHelper::GLOBAL_STATUSES) ? @color : "none"
	end
end
