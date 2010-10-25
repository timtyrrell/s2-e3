class Game
  attr_accessor :rooms, :current_room, :previous_action, :player

  def initialize(rooms, player)
    @rooms = rooms
    @current_room = rooms.first
    @player = player
  end
end

