class UserComponent < Base::LiveComponent

  with_collection_parameter :user

  def initialize(view_context: nil, user:, show:true, edit:false, destroy:false)
    # required values
    @user = user
    @id = "user_#{user.id}"
    @title = user&.full_name&.html_safe
    @color = @color || "primary"

    
    @show = !!show
    @edit = !!edit
    @destroy = !!destroy

    # LiveComponent identify
    @streamable = "users"
    @target = @user
    super
  end

  def call
    render(Static::CardComponent.new(object: user)) do
      tag.div( tag.span(@title), class: "col align-self-center") + 
      tag.div(class: "col-auto pr-0") do 
        (@edit ? render(Button::SmallComponent.new(link: edit_user_path(user), title: "Editar", color: "none", icon: "edit" ))  : ''.html_safe) +
        (@show ? render(Button::SmallComponent.new(link: user_path(user), title: "Ver", icon: "open_in_new", color: @color, data: {turbo: false} ))  : ''.html_safe) +
        (@destroy ? render(Button::SmallComponent.new(link: user_path(user), title: "Borrar", color: "danger", method: :delete, data: { confirm: '¿Estás seguro?' } )) : ''.html_safe) 
      end 
    end
  end

  private

  attr_reader :user

  def render?
    @user.present?
  end

end