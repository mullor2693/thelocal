class Admin::Table::Shared::ActionsComponent < ViewComponent::Base
	def initialize(link:, color:nil, edit:false, destroy:true)
		@link = link
		@color = color || "primary"
		@edit = !!edit
		@destroy = !!destroy
	end

	def call
		tag.td(class: "td-actions text-right") do 
			render(Button::SmallComponent.new(link: @link, title: "Ver", icon: "open_in_new", color: @color, data: {turbo: false} )) +
			(@edit ? render(Button::SmallComponent.new(link: @link, title: "Editar", color: "none", icon: "edit" )) : ''.html_safe) +
			(@destroy ? render(Button::SmallComponent.new(link: @link, title: "Borrar", color: "danger", method: :delete, data: { confirm: '¿Estás seguro?' } )) : ''.html_safe) 
		end 
	end
end
