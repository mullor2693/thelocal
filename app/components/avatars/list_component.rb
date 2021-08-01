class Avatars::ListComponent < Base::StaticComponent

  def initialize(avatars:)
    @avatars = avatars
  end
 
  def call
    tag.div(class:"avatars") do
      render(Avatars::ItemComponent.with_collection(@avatars))
    end
  end

  private

  attr_reader :avatars

  def render?
    @avatars&.any?
  end

end