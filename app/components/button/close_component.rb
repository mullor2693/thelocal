class Button::CloseComponent < Base::StaticComponent
	def initialize(classes:nil)
		@classes = classes 
	end
	def call 
		render(Button::FabComponent.new('close', color: 'danger', classes: @classes, data: { action:"click->reveal#toggle"}))
	end
end
