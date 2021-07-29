class StimulusComponents::Reveals::BlockComponent < Base::StaticComponent

  def initialize(ext_text:nil, int_text:nil)
    @ext_text = ext_text ? tag.span(int_text) : nil
    @int_text = int_text ? tag.span(int_text) : nil
  end

  def call
    tag.div(class: "row", data: {controller: "reveal", reveal_hidden_class: 'd-none'}) do
      tag.div(@ext_text, class: "col m-auto", data: { reveal_target: "item" }) +
      tag.div(render(Button::OpenComponent.new()), class: "col-auto m-auto") +
      tag.div( class: "d-none col-12", data: { reveal_target: "item" } ) do
        tag.div(class: "row") do
          tag.div(@int_text, class: "col m-auto") +
          tag.div(render(Button::CloseComponent.new()), class: "col-auto m-auto") +
          tag.div(content, class: "col-12")
        end
      end
    end
  end

  private

  attr_reader :ext_text

end