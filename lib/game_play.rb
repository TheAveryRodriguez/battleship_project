class GamePlay
  attr_reader :computer_board, :computer_cruiser,
    :computer_sub, :computer_sunk_ships, :player_board,
    :player_cruiser, :player_sub, :player_sunk_ships

  def play
    @computer_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_sub = Ship.new("Submarine", 2)
    @computer_sunk_ships = 0
    @player_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_sub = Ship.new("Submarine", 2)
    @player_sunk_ships = 0

    menu
    computer_sub_placement
    computer_cruiser_placement
    computer_placement_message
    player_cruiser_placement
    player_sub_placement
    turn
    over?
  end

  def menu
    puts "Welcome to BATTLESHIP!!
    Enter p to play. Enter q to quit."
    input = gets.chomp.downcase
    if input == "p"
      puts "Welcome aboard!"
    elsif input == "q"
      puts "Shove off, Sailor!"
      menu
    else
      puts "Invalid Input"
      menu
    end
  end

  def computer_sub_placement
    valid_sub_coordinates = @computer_board.cells.keys.sample(2)
    until @computer_board.valid_placement?(@computer_sub, valid_sub_coordinates) == true
      valid_sub_coordinates = @computer_board.cells.keys.sample(2)
    end
    @computer_board.place(@computer_sub, valid_sub_coordinates)
  end

  def computer_cruiser_placement
    valid_cruiser_coordinates = @computer_board.cells.keys.sample(3)
    until @computer_board.valid_placement?(@computer_cruiser, valid_cruiser_coordinates) == true
      valid_cruiser_coordinates = @computer_board.cells.keys.sample(3)
    end
    @computer_board.place(@computer_cruiser, valid_cruiser_coordinates)
  end

  def computer_placement_message
    puts @computer_board.render
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
  end

  def player_cruiser_placement
    puts "Enter squares for your Cruiser (3 spaces):"
    player_cruiser_input = gets.chomp.upcase.split
    if @player_board.valid_placement?(@player_cruiser, player_cruiser_input) == true
      @player_board.place(@player_cruiser, player_cruiser_input)
    else
      puts "Those are invalid coordinates. Please try again."
      player_cruiser_placement
    end
  end

  def player_sub_placement
    puts "Enter squares for your Submarine (2 spaces):"
    player_sub_input = gets.chomp.upcase.split
    if @player_board.valid_placement?(@player_sub, player_sub_input) == true
      @player_board.place(@player_sub, player_sub_input)
    else
      puts "Those are invalid coordinates. Please try again."
      player_sub_placement
    end
  end

  def turn
    puts "=============COMPUTER BOARD============="
    puts @computer_board.render
    puts "==============PLAYER BOARD=============="
    puts @player_board.render(true)
    puts "Enter the coordinate for your shot:"
    player_choice = gets.chomp.upcase
    if @computer_board.valid_coordinate?(player_choice)
      @computer_board.cells[player_choice].fire_upon
      player_result = @computer_board.cells[player_choice].render
      @computer_sunk_ships += 1 if player_result == "X"
    else
      puts "Please enter a valid coordinate."
      turn
    end
    computer_choice = @player_board.cells.keys.sample(1).join
    until @player_board.cells[computer_choice].fired_upon? == false
      computer_choice = @player_board.cells.keys.sample(1).join
    end
    @player_board.cells[computer_choice].fire_upon
    computer_result = @player_board.cells[computer_choice].render(true)
    if computer_result == "X"
      @player_sunk_ships += 1
    end
    puts "Your shot on #{player_choice} was a #{player_result}."
    puts "My shot on #{computer_choice} was a #{computer_result}."

    if @computer_sunk_ships == 2
      puts "=============COMPUTER BOARD============="
      puts @computer_board.render(true)
      puts "==============PLAYER BOARD=============="
      puts @player_board.render(true)
      puts "You Destroyed My Fleet! YOU WIN!"
      play
    elsif @player_sunk_ships == 2
      puts "=============COMPUTER BOARD============="
      puts @computer_board.render(true)
      puts "==============PLAYER BOARD=============="
      puts @player_board.render(true)
      puts "Your Fleet is DESTROYED! Better Luck Next Time!"
      play
    else
      turn
    end
    over?
  end

  def over?
    if @computer_sunk_ships == 2
      puts "You Destroyed My Fleet! YOU WIN!"
      play
    elsif @player_sunk_ships == 2
      puts "Your Fleet is DESTROYED! Better Luck Next Time!"
      play
    else
      turn
    end
  end
end
