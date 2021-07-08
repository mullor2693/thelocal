# localhost:3000/rails/view_components/
class CardChartComponentPreview < ViewComponent::Preview
  
  # card_chart_component/with_status?status=info
  # statuses: info, warning, danger, success
  def with_status(status: "none")
    render(CardChartComponent.new(
      status: status, 
      chart_id: "dailySalesChart", 
      title: "Title", 
      category: 'Category', 
      footer_text: 'Footer text...'
    ))
  end

end
