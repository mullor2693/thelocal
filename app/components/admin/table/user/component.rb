class Admin::Table::User::Component < ViewComponent::Base

  with_collection_parameter :user

  def initialize(user:)
    @user = user
    @id = "admin-user-#{user.id}"
    @title = user&.full_name
  end

  def call
    content_tag(:tr, id: @id) do 
      content_tag(:td, @title) + render(Admin::Table::Shared::ActionsComponent.new(link: admin_user_path(user), color: "primary"))
    end
  end

  private

  attr_reader :user

  def render?
    user.present?
  end

end