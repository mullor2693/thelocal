# localhost:3000/rails/view_components/
class CardStatsComponentPreview < ViewComponent::Preview
  
  # card_stats_component/with_status?status=info
  # statuses: info, warning, danger, success
  def with_status(status: "none")
    render(CardStatsComponent.new(
      status: status, 
      card_icon: "manage_accounts", 
      category: "Category", 
      title: "Title", 
      footer_icon: "calendar_today", 
      footer_text: "Footer text..." 
    ))
  end

end
 
