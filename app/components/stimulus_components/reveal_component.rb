class StimulusComponents::RevealComponent < Base::StaticComponent

  def initialize(object:nil, title:nil, style:nil, icon:nil)
    @object = object
    @title = title
    @icon = icon
    @style = style || 'default'
  end

  def call
    tag.div(class: "row", data: {controller: "reveal", reveal_hidden_class: 'd-none'}) do
      tag.div(render(Button::BaseComponent.new(style: @style, icon: @icon, title: @title, color:'primary', classes:"pull-right", data: { action:"click->reveal#toggle", reveal_target: "item" })), class: "col-12") +
      tag.div(content, class: "d-none col-12", data: { reveal_target: "item" } )
    end
  end

  private

  attr_reader :object

end