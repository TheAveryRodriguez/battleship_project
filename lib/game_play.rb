class GamePlay

  def game_info
    computer_board = Board.new 
    computer_cruiser = Ship.new("Cruiser", 3)
    computer_sub = Ship.new("Submarine", 2)
    computer_sunk_ships = 0 
  
    player_board = Board.new 
    player_cruiser = Ship.new("Cruiser", 3)
    player_sub = Ship.new("Submarine", 2)
    player_sunk_ships = 0
  end

  def menu 
    puts "Welcome to BATTLESHIP!!
    Enter p to play. Enter q to quit."
    input = gets.chomp.downcase
    if input == "p"
      puts "Welcome aboard!"
      computer_sub_placement
    elsif input == "q"
      puts "Shove off, Sailor!"
      menu 
    else 
      puts "Invalid Input"
      menu
    end
  end 

  def computer_sub_placement 
    valid_sub_coordinates = computer_board.cells.keys.sample(2)
    until computer_board.valid_placement?(computer_sub, valid_sub_coordinates) == true 
      valid_sub_coordinates = computer_board.cells.keys.sample(2)
    end
    computer_board.place(computer_sub, valid_sub_coordinates)
    # player_ship_placement
  end

  def computer_cruiser_placement
    valid_cruiser_coordinates = computer_board.cells.keys.sample(3)
    until computer_board.valid_placement?(computer_cruiser, valid_cruiser_coordinates) == true 
      valid_cruiser_coordinates = computer_board.cells.keys.sample(3)
    end
    computer_board.place(computer_cruiser, valid_cruiser_coordinates)
    # computer_placement_message
  end

  def computer_placement_message
    puts computer_board.render
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    # player_cruiser_placement
  end

  def player_cruiser_placement
    puts "Enter squares for your Cruiser (3 spaces):"
    player_cruiser_input = gets.chomp.upcase.split 
    if player_board.valid_placement?(player_cruiser, player_cruiser_input) == true 
      player_board.place(player_cruiser, player_cruiser_input)
    else
      puts "Those are invalid coordinates. Please try again."
      player_cruiser_placement 
    end
    # player_sub_placement
  end

  def show_board
    puts "=============COMPUTER BOARD============="
    puts     # render computer board(false)
    puts "==============PLAYER BOARD=============="
    puts     #render user board(true)
  end
end