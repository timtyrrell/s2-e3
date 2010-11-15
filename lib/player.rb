class Player
  attr_accessor :item

  def set_item(item)
    @item = item
  end

  def remove_item
    @item = nil
  end

end

