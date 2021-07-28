class Table::TdActionsComponent < ViewComponent::Base
	def initialize(link:, color:nil, destroy:true)
		@link = link
		@color = color || "primary"
		@destroy = !!destroy
	end

	def call
		 content_tag(:td, class: "td-actions text-right") do 
			 render(Button::SmallComponent.new(link: @link, title: "Ver", icon: "open_in_new", color: @color )) +
			 if @destroy 
				 render(Button::SmallComponent.new(link: @link, title: "Borrar", color: "danger", method: :delete, data: { confirm: '¿Estás seguro?' } )) 
			 end 
		 end 
	end
end
