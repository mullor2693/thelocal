class Button::CloseComponent < Base::StaticComponent
	def initialize(classes:nil, data:nil)
		@classes = classes 
		@data = data || { action:"click->reveal#toggle"}
	end
	def call 
		render(Button::FabComponent.new('close', color: 'danger', classes: @classes, data: @data))
	end
end
