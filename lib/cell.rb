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
    if @ship.nil? && @ship.hit
      true
    else
      false
    end
  end

  def fire_upon
    if !@ship.nil?
      @ship.hit
    else
      p "(¯`·._.··¸.-~*´¨¯¨`*·~-.,-(_YOU MISSED_)-,.-~*´¨¯¨`*·~-.¸··._.·´¯)"
    end
  end
end
