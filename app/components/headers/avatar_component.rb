class Headers::AvatarComponent < Base::HeaderComponent
	
  def initialize(user:, color:nil, data:nil)
		super(title: user.full_name, color: color, data: data)
		@user = user
    @classes += ' with-avatar'
	end

  def call 
		tag.div(class: @classes, data: @data) do
			tag.div(class: 'row') do
				tag.div(@final_tag, class: 'col m-auto') + tag.div(render(Avatars::BaseComponent.new(image: @user.avatar_thumbnail, letters: @user.name_initials)), class: 'col-auto m-auto')
			end
		end
	end

end