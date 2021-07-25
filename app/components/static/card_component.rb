class Static::CardComponent < Base::StaticComponent

  def initialize(object:nil)
    @object = object
    @id = "#{object&.class&.model_name&.element}_#{object&.id}" if object.present?
  end

  def call
    if @object.present? 
      turbo_frame_tag dom_id(@object), class: "col-md-6 py-2" do 
        tag.div(class:"card h-100 my-2 mb-0", id: @id) do
          tag.div(content, class:"card-body w-100 h-100 align-self-center row")
        end
      end
    else
      tag.div class: "col-md-6 py-2" do 
        tag.div(class:"card h-100 my-2 mb-0") do
          tag.div(content, class:"card-body w-100 h-100 align-self-center row")
        end
      end
    end
  end

  private

  attr_reader :object

end