class Headers::AnimatedComponent < Base::HeaderComponent
	
	def initialize(title:nil, subtitle:nil, color:nil, data:nil)
		super
		@data[:header_animation] = true
	end

end
