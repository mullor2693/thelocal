module CardsHelper
    def card_wrapper(&block)  
        content = capture(&block)   
        content_tag(:div, content, class: "card")
    end
end