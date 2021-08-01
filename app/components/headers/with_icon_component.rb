class Headers::WithIconComponent < Base::HeaderComponent
	def initialize(title:nil, subtitle:nil, color:nil, icon:nil, data:nil)
		super
    @classes += ' card-header-icon'
    @icon = icon || "highlight_off"
    @subtitle_tag = tag.p(subtitle, class: "card-category") if subtitle.present?
    @title_tag = tag.h3(title, class: 'card-title') if title.present?
    @icon_tag = content_tag(:div, content_tag(:i, @icon, class: 'material-icons'), class: 'card-icon')
    @final_tag = @icon_tag+@subtitle_tag+@title_tag
	end
end