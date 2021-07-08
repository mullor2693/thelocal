# frozen_string_literal: true

class ProfileCardComponent < ViewComponent::Base
  def initialize(avatar:, avatar_link:, category:, title:, description:, footer_link:, footer_link_text:)
    @avatar = avatar
    @avatar_link = avatar_link
    @category = category
    @title = title
    @description = description
    @footer_link = footer_link
    @footer_link_text = footer_link_text
  end

end
