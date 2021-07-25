class Base::StaticComponent < ViewComponent::Base
  include ActionView::Context, ActionView::Helpers::TagHelper  
  include Turbo::FramesHelper, Turbo::Streams::StreamName, Turbo::Streams::Broadcasts
end