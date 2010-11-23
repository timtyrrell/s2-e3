module KittenRescue
  module Actions
    class Look
      attr_accessor :parsed_text

      def matches?(text)
        parsed_text = text.split(' ')
        if parsed_text.first == "look" and parsed_text[1] == "at"
          return true
        end
        false
      end

      def execute(game, text)
        @parsed_text = text.split(' ')
        if is_a_lookable_item?(game)
          match_item_to_room(game)
        else
          "*** #{@parsed_text[2]} is not a supported lookable item ***"
        end
      end

      def is_a_lookable_item?(game)
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
              return item["detail"]
            end
          end
        end
      end

    end
  end
end

