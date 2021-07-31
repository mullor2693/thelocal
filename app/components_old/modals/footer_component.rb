class Modals::FooterComponent < ViewComponent::Base
	def initialize(color:nil, color_secondary:nil, save_text:nil, dimiss_text:nil, close:false)
    @save_text = save_text || 'Guardar'
    @dimiss_text = dimiss_text || 'Cerrar'
    @color_primary = @color = color || 'primary'
    @color_secondary = color_secondary || 'secondary'
	end

	def call
    content_tag(:div, class: "modal-footer") do
      content_tag(:button, @save_text, type:"button", class:"btn btn-#{@color_primary}") +
      content_tag(:button, @dimiss_text, type:"button", class:"btn btn-#{@color_secondary}")
    end
  end

end

