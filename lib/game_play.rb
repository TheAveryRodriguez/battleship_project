class GamePlay

  def menu 
    puts "Welcome to BATTLESHIP!!

    Enter p to play. Enter q to quit."
    input = gets.chomp
    if input == "p"
      puts "Welcome aboard!"
    elsif input == "q"
      puts "Shove off, Sailor!"
    else 
      puts "Invalid Input"
    end
  end 
end