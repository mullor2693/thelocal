class Base::AvatarComponent < Base::StaticComponent
	def initialize(image:nil, letters:nil)
    @final_tag = tag.div(letters, class: "avatar__letters") if letters.present? 
    @final_tag = image_pack_tag(image, class: "avatar__image") if image.present? 
	end

	def call
    tag.div(@final_tag, class:"avatar")
	end
end
