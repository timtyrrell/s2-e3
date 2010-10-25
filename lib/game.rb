class Game
  attr_accessor :rooms, :current_room, :previous_action

  def initialize(rooms)
    @rooms = rooms
    @current_room = rooms.first
  end
end

