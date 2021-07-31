class Base::ToastComponent < Base::StaticComponent
	def initialize(title, message)
	end

	def call
		tag.div data: {controller: "alert"}, class:"shadow-lg rounded mb-1 bg-white", style:"max-width: 20rem;" do
    	tag.div(class:"toast-header" disabled:true) do
        # tag.img(src:"...", class:"rounded mr-2", alt:"...") +
        tag.strong(title, class:"mr-auto") +
        # tag.small("11 mins ago") +
        render(Button::CloseComponent.new(data: {action: "alert#close"}, classes: "ml-2 mb-1 close"))
			end +
      tag.div(message, class:"toast-body", disabled: true)
  	end
	end
end
