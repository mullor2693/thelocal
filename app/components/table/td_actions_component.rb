class Table::TdActionsComponent < ViewComponent::Base
	def initialize(link:, color:nil)
		@link = link
		@color = color || "primary"
	end
end
