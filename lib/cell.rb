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
    if empty? == false
      @ship.hit
    end
  end

  def render(reveal_ship = false)
    if !@fired_upon && !empty? && reveal_ship
      'S'
    elsif @fired_upon && empty?
      'M'
    elsif @fired_upon && empty? == false && @ship.sunk?
      'X'
    elsif @fired_upon && empty? == false
      'H'
    elsif @fired_upon == false
      '.'
    end
  end
end
