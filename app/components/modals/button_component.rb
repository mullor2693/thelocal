class Modals::ButtonComponent < ViewComponent::Base
	def initialize(target:, content:, color:nil, disabled:nil, style:nil)
    @target = target
		@content = content
		@color = color
		@disabled = disabled
    @style = style
	end

	def call
    render(Button::BaseComponent.new(content: @content, disabled: @disabled, color: @color, data: {toggle: "modal", target: @target}, style: @style, size: @size))
  end

end