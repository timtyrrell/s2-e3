module ScreenUtil
  extend self

  def clear
    puts "\e[H\e[2J" # clear the screen
  end

  #put the items in a readable list
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

end

