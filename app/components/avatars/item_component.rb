class Avatars::ItemComponent < Base::AvatarComponent

  with_collection_parameter :avatar

  def initialize(avatar:)
    @avatar = avatar
  end

  def call
    tag.div(class: "avatars__item") do
      tag.div(image_tag(@avatar, class:'avatar__image'), class: "avatars__image")
    end
  end

  private

  attr_reader :avatar

  def render?
    @avatar.present?
  end

end