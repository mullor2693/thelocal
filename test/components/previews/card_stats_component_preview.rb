# localhost:3000/rails/view_components/
class CardStatsComponentPreview < ViewComponent::Preview
  
  # card_stats_component/with_color?color=info
  # statuses: info, warning, danger, success
  def with_color(color: "none")
    render(CardStatsComponent.new(
      color: color, 
      card_icon: "manage_accounts", 
      category: "Category", 
      title: "Title", 
      footer_icon: "calendar_today", 
      footer_text: "Footer text..." 
    ))
  end

end
 
