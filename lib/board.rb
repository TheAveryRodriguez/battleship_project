class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    @cells.key?(coordinate) && @cells[coordinate].fired_upon? == false
  end

  def valid_placement?(ship, coordinates)
    ship.length == coordinates.length &&
      coordinates.all? { |coordinate| valid_coordinate?(coordinate) } &&
      consec_horizontal?(coordinates) || consec_vertical(coordinates)
  end

  def consec_horizontal?(coordinates)
    row = coordinates.first[0]
    numbers = coordinates.map { |coord| coord[1..-1].to_i }
    numbers == (numbers.first..numbers.last).to_a && coordinates.all? { |coord| coord[0] == row }
  end

  def consec_vertical(coordinates)
    numbers = coordinates.first[1]
    row = coordinates.map { |coord| coord[0].to_s }
    row == (row.first..row.last).to_a && coordinates.all? { |coord| coord[1] == numbers }
  end

  def place(ship, coordinates)
    @ship
  end
end
