module KittenRescue
  module Actions
    class Go
      attr_accessor :parsed_text

      def matches?(text)
        parsed_text = text.split(' ')
        if parsed_text.first == "go"
          return true
        end
        false
      end

      def execute(game, text)
        @parsed_text = text.split(' ')
        if is_a_possible_direction?(game)
          room = match_direction_to_room(game)
          game.set_current_room(room) unless room.nil?
          return ""
        else
          "*** #{@parsed_text[1]} is not a supported direction ***"
        end
      end

      def is_a_possible_direction?(game)
        matched = false
        game.current_room["places"].each do |place|
          place.each do |key, value|
            if @parsed_text[1] == key
              matched = true
            end
          end
        end
        matched
      end

      def match_direction_to_room(game)
       #of the available places
        game.current_room["places"].each do |place|
          place.each do |key, value|
            #get the value for the direction selected
            if(@parsed_text[1] == key)
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
  end
end

