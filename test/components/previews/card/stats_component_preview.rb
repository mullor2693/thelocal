# localhost:3000/rails/view_components/
class Card::StatsComponentPreview < ViewComponent::Preview
  
  # card/stats_component/with_color?color=info
  # statuses: info, warning, danger, success
  def with_color(color:nil)
    render(Card::StatsComponent.new(
      color: color, 
      card_icon: "manage_accounts", 
      category: "Category", 
      title: "Title", 
      link: '#href',
      footer_icon: "calendar_today", 
      footer_text: "Footer text..." 
    ))
  end

end
 
