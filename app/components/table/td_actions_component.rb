class Table::TdActionsComponent < ViewComponent::Base
	def initialize(link:, color:nil, destroy:true)
		@link = link
		@color = color || "primary"
		@destroy = !!destroy
	end
end
