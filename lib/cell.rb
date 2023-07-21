class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    if fire_upon == true
      true
    end
  end

  def fire_upon
    if !@ship.nil?
      @ship.hit
    else
      # PLACE MISS
    end
  end
end
