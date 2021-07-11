class Card::HeaderComponent < ViewComponent::Base
	def initialize(title:, subtitle:, color:nil)
		@title = title
		@subtitle = subtitle
		@color = color
    @status = @color.in?(ApplicationHelper::GLOBAL_STATUSES) ? @color : "none"
	end
end
