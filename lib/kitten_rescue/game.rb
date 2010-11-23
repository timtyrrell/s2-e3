module KittenRescue
  class Game
    attr_accessor :rooms, :current_room, :previous_action, :player, :actions

    def initialize(rooms, player)
      @actions = []
      @rooms = rooms
      @current_room = rooms.first
      @player = player
    end

    def register_action(action)
      @actions << action
    end

    def run
      result = ""
      message = ""
      until result == "quit"
        #output room and collect input
        KittenRescue::Util::ScreenUtil.display_output(self, message)
        @previous_action = result = gets.chomp
        message = execute_input_action(result)
    end

    end

    def add_item_to_current_room(item)
      @current_room["items"] << item
    end

    def set_current_room(room)
      @current_room = room
    end

    def clear_current_room_items
      @current_room["items"].clear
    end

    private
      def execute_input_action(input)
        action = @actions.find { |act| act.matches?(input) }
        if action.nil?
           "*** #{input} is not a supported action ***"
        else
          action.execute(self, input)
        end
      end
  end
end

