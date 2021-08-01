class Headers::WithButtonComponent < Base::HeaderComponent
	
  def initialize(title:nil, subtitle:nil, color:nil, data:nil)
		super
    @show_button = true
    @classes += ' with-button'
    @button = !!data.try(:[], :button).try(:[], :open) ? Button::OpenComponent.new() : Button::CloseComponent.new()
	end

  def call 
		tag.div(class: @classes, data: @data) do
			@final_tag + render(@button)
		end
	end

end