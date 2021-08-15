class Button::OutlineComponent < Base::ButtonComponent
	def initialize(icon, disabled:nil, color:nil, status:nil, data:nil, size:nil, classes:nil, responsive:true, name:nil, type:nil, inner:false)
		super(style: 'outline', icon: icon, disabled: disabled, color: color, status: status, data: data, size: size, classes: classes, responsive: responsive, name: name, type: type, inner: inner)
	end
end
