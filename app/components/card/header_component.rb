class Card::HeaderComponent < ViewComponent::Base
	def initialize(title:, subtitle:nil, color:nil, edit_link:nil)
		@title = title
		@subtitle = subtitle
		@color = color
    @status = @color.in?(ApplicationHelper::GLOBAL_STATUSES) ? @color : "none"
		@edit_link = edit_link
	end
end
