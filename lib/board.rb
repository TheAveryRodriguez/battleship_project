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
      (consec_horizontal?(coordinates) || consec_vertical(coordinates)) &&
      coordinates.none? { |coordinate| @cells[coordinate].ship }
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
    return unless valid_placement?(ship, coordinates)

    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def render(reveal_ship = false)
    if reveal_ship == false 
      "  1 2 3 4 \n" +
      "A " "#{@cells["A1"].render} " + "#{@cells["A2"].render} " + "#{@cells["A3"].render} " + "#{@cells["A4"].render} \n" +
      "B " "#{@cells["B1"].render} " + "#{@cells["B2"].render} " + "#{@cells["B3"].render} " + "#{@cells["B4"].render} \n" +
      "C " "#{@cells["C1"].render} " + "#{@cells["C2"].render} " + "#{@cells["C3"].render} " + "#{@cells["C4"].render} \n" +
      "D " "#{@cells["D1"].render} " + "#{@cells["D2"].render} " + "#{@cells["D3"].render} " + "#{@cells["D4"].render} \n" 
    end
  end
end
