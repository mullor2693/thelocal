class Button::SmallComponent < ViewComponent::Base
	def initialize(link:, title:nil, icon:nil, color:nil, method:nil, data:nil)
		@link = link
		@title = title || "content"
		@icon = icon || "close"
		@color = color
		@method = method || nil
		@data = data || {}
    @status = @color.in?(ApplicationHelper::GLOBAL_STATUSES) ? @color : "none"
	end

	def call
		link_to @link, method: @method, data: @data do
			content_tag(:button, content_tag(:i, @icon, class: "material-icons"), title: @title, class:"btn btn-#{@status} btn-link btn-sm")
		end
	end
end
