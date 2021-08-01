class Base::IndicatorComponent < Base::StaticComponent
	
	def initialize()
	end

	def call
		tag.div(class: "container") do
			content + tag.div(class: "container__indicator")
		end
	end

end
