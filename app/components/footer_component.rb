# frozen_string_literal: true

class FooterComponent < ViewComponent::Base
  def initialize(link:, link_text:, copyright_text:)
    @link = link
    @link_text = link_text
    @copyright_text = copyright_text
  end

end
