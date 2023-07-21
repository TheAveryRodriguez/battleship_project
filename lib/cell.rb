class Cell
  attr_reader :coordinate, 
              :ship

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

  def render(view_ship = false)
    if !@fired_upon && !empty? && view_ship
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
