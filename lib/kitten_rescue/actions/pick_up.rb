module KittenRescue
  module Actions
    class PickUp
      attr_accessor :parsed_text

      def matches?(text)
        parsed_text = text.split(' ')
        if parsed_text.first == "pick" and parsed_text[1] == "up"
          return true
        end
        false
      end

      def execute(game, text)
        @parsed_text = text.split(' ')
        if is_a_pickable_item?(game)
          game.player.set_item(match_item_to_room(game))
          if game.current_room["items"].first == game.player.item
            game.clear_current_room_items
          end
          return ""
        else
          "*** #{@parsed_text[2]} is not a supported pickable item ***"
        end
      end

      def is_a_pickable_item?(game)
        matched = false
        game.current_room["items"].each do |item|
          item.each do |key, value|
            if @parsed_text[2] == value
              matched = true
            end
          end
        end
        matched
      end

      def match_item_to_room(game)
       #of the available items
        game.current_room["items"].each do |item|
          item.each do |key, value|
            #get the value for the  selected
            if(@parsed_text[2] == value)
              return item
            end
          end
        end
      end
    end
  end
end

