class Progress::BarComponent < ViewComponent::Base
	def initialize(badge_text:nil, value:nil, min:nil, max:nil, status:nil, striped:false)
    @badge_text = badge_text
    @value = value || 0
    @min = min || 0
    @max = max || 100
    @status = status || 'default'
    @striped = !!striped
	end

	def call
    content_tag(:div, class: "progress-container#{" progress-#{@status}" if @status != 'default'}") do
      content_tag(:span, @badge_text, class:"progress-badge") +
      content_tag(:div, class: "progress-bar#{" progress-bar-striped" if @striped}#{" progress-bar-#{@status}" if @status != 'default'}", role: "progressbar", aria: {valuenow: "#{value}", valuemin: "#{min}" valuemax: "#{max}"}, style: "width: #{value}%;"), class: "progress")
    end
  end

end

