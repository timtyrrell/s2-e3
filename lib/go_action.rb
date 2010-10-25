module GoAction
  extend self

  def go(game, direction)
     if GoAction.is_a_possible_direction?(game, direction)
      game.current_room = GoAction.match_direction_to_room(game, direction)
      ""
    else
      "*** #{direction} is not a supported direction ***"
    end
  end

  #put the directions in a readable list
  def output_directions(game)
    directions = []
    game.current_room["places"].each do |place|
      place.each do |key, value|
        directions << key
      end
    end
    directions.join(", ")
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

end

