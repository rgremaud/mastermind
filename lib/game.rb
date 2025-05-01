class Game
  
  def initialize
    @win_trigger = nil 
    @human_player = nil 
    @computer_player = nil
    @board = nil
    @code_breaker = nil
  end

  def code_break_loop
    i = 0 
    loop do
      i += 1
      @board.input
      @board.win_check
      @board.peg_matches
      @board.display_storage
      break if i == 12 || @board.win_check === true
    end
    if @board.win_check != true then @board.you_lose
    else
      puts "Congrats!  You cracked the code!"
    end
  end

  def create_players 
    print "Please enter your name: "
    name = gets.chomp.to_s
    @human_player = Player.new(name)
    puts @human_player.name
    print "Would you like to be code breaker or the code master? "
    print "Please enter breaker or master: "
    @code_breaker = gets.chomp.to_s.downcase
  end

  def game_loop
    create_players
    if @code_breaker == "breaker"
      @board = Board.new
      @board.code_creation
      puts "The code master has set the code!" 
      puts "Your color options are red, green, blue, yellow, orange and purple."
      puts "When inputting a guess please enter four colors seperated by a space."
      puts "Example input: red blue green orange"
      puts "Red pegs indicate an EXACT match"
      puts "White pegs indicate a RELATIVE match"
      code_break_loop
    elsif @code_breaker == "master"
      @board = Computer_Board.new
      @board.code_set
      @board.code_break_pc
    end
  end

end