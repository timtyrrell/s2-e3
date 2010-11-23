module KittenRescue
  class Room
    attr_accessor :id, :name, :description, :places, :items

    def initialize(id, name, description, places, items)
      @id = id
      @name = name
      @description = description
      @places = places
      @items = items
    end

    def clear_items
      @items.clear
    end

  end
end

