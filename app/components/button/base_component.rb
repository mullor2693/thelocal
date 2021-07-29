class Button::BaseComponent < ViewComponent::Base
	def initialize(title:nil, icon:nil, disabled:nil, color:nil, status:nil, data:nil, style:nil, size:nil, classes:nil, responsive:true, name:nil, type:nil)
		
		btn_styles = ['default', 'round', 'fab', 'icon', 'icon-r', 'simple']
		responsive_styles = ['icon-r', 'icon', 'round', 'default']
		# BTN_SIZE = [:default,:small, :large]
		
		@responsive = !!responsive
		@style = (!style.nil? && btn_styles.include?(style)) ? style : 'default'
		is_responsive = !!@responsive && responsive_styles.include?(@style) && icon.present?
		
		@base_title = title || "title"

		span_header = is_responsive ? '<span class="d-none d-sm-inline-block">' : '<span>'
		@title = (span_header+@base_title+'</span>').html_safe
		
		@icon = icon || "undo"
		icon_header = is_responsive ? '<i class="material-icons d-sm-none">' : '<i class="material-icons">'
		
		@fab_title = (icon_header+@icon+'</i>').html_safe
		@icon_title = (icon_header+@icon+'</i>'+@title).html_safe
		@iconr_title = (@title+icon_header+@icon+'</i>').html_safe
		
		@title = @fab_title if @style == 'fab'
		@title = @icon_title if @style == 'icon' || is_responsive
		@title = @iconr_title if @style == 'icon-r'
		
		@data = data || {}
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
