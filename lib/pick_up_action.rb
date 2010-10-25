module PickUpAction
  extend self

  def pick_up(game, input)
    if self.is_a_pickable_item?(game, input)
      game.player.item = self.match_item_to_room(game, input)
      if game.current_room["items"].first == game.player.item
        game.current_room["items"].clear
      end
      ""
    else
      "*** #{input} is not a supported pickable item ***"
    end
  end

  def is_a_pickable_item?(game, input_item)
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
          return item
        end
      end
    end
  end
end

