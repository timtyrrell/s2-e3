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
end

