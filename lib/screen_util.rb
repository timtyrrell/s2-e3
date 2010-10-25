module ScreenUtil
  extend self
  def clear
    puts "\e[H\e[2J" # clear the screen
  end
  def output_directions(game)
    directions = []
    game.current_room["places"].each do |place|
      place.each do |key, value|
        directions << key
      end
    end
    directions.join(", ")
  end

  def output_items(game)
    items = []
    game.current_room["items"].each do |item|
      item.each do |key, value|
        if(key["name"])
          items << value
        end
      end
    end
    items.join(", ")
  end

  def is_a_possible_direction?(game, input_direction)
    matched = false
    game.current_room["places"].each do |place|
      place.each do |key, value|
        if input_direction == key
          matched = true
        end
      end
    end
    matched
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

  def match_direction_to_room(game, selected_direction)
   #of the available places
    game.current_room["places"].each do |place|
      place.each do |key, value|
        #get the value for the direction selected
        if(selected_direction == key)
          game.rooms.each do |room|
          #match the value to an id of a room and set it the current_room
            if room["id"] == value
              return room
            end
          end
        end
      end
    end
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

