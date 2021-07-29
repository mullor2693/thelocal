class Button::OpenComponent < Base::StaticComponent
	def initialize(classes = nil)
		@classes = classes 
	end
	def call
		render(Button::FabComponent.new('add', color:'primary', classes: @classes, data: { action:"click->reveal#toggle", reveal_target: "item" }))
	end
end
