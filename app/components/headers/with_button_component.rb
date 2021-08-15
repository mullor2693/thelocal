class Headers::WithButtonComponent < Base::HeaderComponent
	
  def initialize(title:nil, subtitle:nil, color:nil, data:nil)
		super
    @show_button = true
    @classes += ' with-button'
    @button = !!data.try(:[], :button).try(:[], :open) ? Button::OpenComponent.new() : Button::CloseComponent.new()
	end

  def call 
		tag.div(class: @classes, data: @data) do
			tag.div(class: 'row') do
				tag.div(@final_tag, class: 'col m-auto') + tag.div(render(@button), class: 'col-auto m-auto')
			end
		end
	end

end