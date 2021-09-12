class Avatars::BaseComponent < Base::StaticComponent
	def initialize(image:nil, letters:nil)
    @letters = letters
    @image = image
	end

	def call
    tag.div(class:"avatar") do
			if @image.present? 
				image_pack_tag(@image, class: "avatar__image") 
			else
				tag.div(@letters, class: "avatar__letters")
			end
		end
	end
end
