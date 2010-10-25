module UseAction
  extend self

  def use(game, item)
    if game.player.item["name"] == item
      game.player.item["uses"].each do |use|
        use.each do |key, value|
          if game.current_room['id'] == key
            return value
          end
        end
      end

      ""
    else
      "*** Cannot use #{input} ***"
    end
  end
end

