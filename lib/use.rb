class Use
  attr_accessor :parsed_text

  def matches?(text)
    parsed_text = text.split(' ')
    if parsed_text.first == "use"
      return true
    end
    false
  end

  def execute(game, text)
    @parsed_text = text.split(' ')
    if game.player.item["name"] == @parsed_text[1]
      game.player.item["uses"].each do |use|
        use.each do |key, value|
          if game.current_room['id'] == key
            return value
          end
        end
      end

      return ""
    else
      "*** Cannot use #{input} ***"
    end
  end

end

