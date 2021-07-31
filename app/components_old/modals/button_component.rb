class Modals::ButtonComponent < ViewComponent::Base
	def initialize(target:, title:, color:nil, disabled:nil, style:nil)
    @target = target
		@title = title
		@color = color
		@disabled = disabled
    @style = style
	end

	def call
    render(Button::BaseComponent.new(title: @title, disabled: @disabled, color: @color, data: {toggle: "modal", target: @target}, style: @style, size: @size))
  end

end