class StimulusComponents::RevealComponent < Base::StaticComponent

  def initialize(object:nil, title:nil)
    @object = object
    @title = title || '+'
  end

  def call
    tag.div(class: "w-100", data: {controller: "reveal", reveal_hidden_class: 'd-none'}) do
      tag.div(render(Button::BaseComponent.new(title: @title, color:'primary', classes:"pull-right", data: { action:"click->reveal#toggle", reveal_target: "item" })), class: "col-12") +
      tag.div(content, class: "d-none col-12", data: { reveal_target: "item" } )
    end
  end

  private

  attr_reader :object

end