class Button::BaseComponent < ViewComponent::Base
	def initialize(title:nil, icon:nil, disabled:nil, color:nil, status:nil, data:nil, style:nil, size:nil, classes:nil, responsive:true, name:nil, type:nil, inner:false)
		
		btn_styles = ['default', 'round', 'fab', 'icon', 'icon-r', 'simple']
		responsive_styles = ['icon-r', 'icon', 'round', 'default']
		# BTN_SIZE = [:default,:small, :large]
		
		@style = (!style.nil? && btn_styles.include?(style)) ? style : 'default'
		is_responsive = !!responsive && responsive_styles.include?(@style) && icon.present?
		@data = !inner ? data : nil
		
		@base_title = title || "title"
		@icon = icon || "close"
		icon_data = span_data = inner ? data : nil
		icon_classes = is_responsive ? "material-icons d-sm-none" : "material-icons"
		span_classes = is_responsive ? 'd-none d-sm-inline-block' : nil
		tittle_tag =  tag.span(@base_title, class: @span_classes, data: span_data)
		icon_tag =  tag.i(@icon, class: icon_classes, data: icon_data)
		
		@title = tittle_tag.html_safe

		@fab_title = icon_tag.html_safe
		@icon_title = (icon_tag+@title).html_safe
		@iconr_title = (@title+icon_tag).html_safe
		
		@title = @fab_title if @style == 'fab'
		@title = @icon_title if @style == 'icon' || is_responsive
		@title = @iconr_title if @style == 'icon-r'
		
		
		@color = color
    @status = status || (@color.in?(ApplicationHelper::GLOBAL_STATUSES) ? @color : "none")
		@class = "btn btn-#{@status}"
		@class += " btn-fab btn-fab-mini btn-round" if @style == 'fab' 
		@class += " btn-round" if (@style == 'icon' || @style == 'icon-r' || @style == 'round')
		@class += " btn-sm" if @size == "small"
		@class += " btn-lg" if @size == "large"
		@class += " #{classes}" if classes
		@disabled = !!disabled

		@type = type || "button"
		@name = name || "button"
		
	end

	def call
		button_tag(@title, class: @class, disabled: @disabled, data: @data, type: @type, name: @name)
	end
end
