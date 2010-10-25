module LookAction
  extend self

  def look(game, input)
    if self.is_a_lookable_item?(game, input)
      self.match_item_to_room(game, input)
    else
      "*** #{input} is not a supported lookable item ***"
    end
  end

  def is_a_lookable_item?(game, input_item)
    matched = false
    game.current_room["items"].each do |item|
      item.each do |key, value|
        if input_item == value
          matched = true
        end
      end
    end
    matched
  end

  def match_item_to_room(game, selected_item)
   #of the available items
    game.current_room["items"].each do |item|
      item.each do |key, value|
        #get the value for the  selected
        if(selected_item == value)
          return item["detail"]
        end
      end
    end
  end

end

