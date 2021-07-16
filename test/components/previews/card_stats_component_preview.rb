# localhost:3000/rails/view_components/
class Card::StatsComponentPreview < ViewComponent::Preview
  
  # card_stats_component/with_color?color=info
  # statuses: info, warning, danger, success
  def with_color(color: "none")
    render(Card::StatsComponent.new(
      color: color, 
      card_icon: "manage_accounts", 
      category: "Category", 
      title: "Title", 
      footer_icon: "calendar_today", 
      footer_text: "Footer text..." 
    ))
  end

end
 
