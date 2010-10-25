module DropAction
  extend self

  def drop(game, item)
    if game.player.item["name"] == item
      game.current_room["items"] << game.player.item
      game.player.item = nil
      ""
    else
      "*** Cannot drop #{input} ***"
    end
  end
end

