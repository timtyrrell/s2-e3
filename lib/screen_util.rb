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

  def display_output(game, message)
    ScreenUtil.clear
    STDOUT.flush
    unless message.empty?
      puts "#{message}"
    end
    unless game.previous_action.nil?
      puts "Previous action: #{game.previous_action}"
    end
    puts "[#{game.current_room["name"]}]"
    puts game.current_room["description"]
    unless game.current_room["items"].nil?
      puts "Obvious items: #{ScreenUtil.output_items(game)}"
    end
    unless game.player.item.nil?
      puts "Current inventory: #{game.player.item["name"]}"
    end
    puts "Obvious paths: #{output_directions(game)}"
    puts "Available Commands: 'go [place]', 'look at [thing]' 'pick up [thing]', 'drop [thing]', 'use [thing]', 'quit'"
  end

  private
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
end

