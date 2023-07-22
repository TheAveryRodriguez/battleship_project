class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true

    if !@ship.nil?
      @ship.hit
      if @ship.sunk?
        "Try Again"
      else
        "Oh snap. You hit a ship!"
      end
    else
      "(¯`·._.··¸.-~*´¨¯¨`*·~-.,-(_YOU MISSED SUCKER_)-,.-~*´¨¯¨`*·~-.¸··._.·´¯)"
    end
  end
end
