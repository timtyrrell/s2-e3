class Drop
  attr_accessor :parsed_text

  def matches?(text)
    parsed_text = text.split(' ')
    if parsed_text.first == "drop"
      return true
    end
    false
  end

  def execute(game, text)
    @parsed_text = text.split(' ')
    if game.player.item["name"] == @parsed_text[1]
      game.add_item_to_current_room(game.player.item)
      game.player.remove_item
      return ""
    else
      "*** Cannot drop #{@parsed_text[1]} ***"
    end
  end
end

