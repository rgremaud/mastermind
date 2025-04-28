class Game
  
  def initialize
    @win_trigger = nil 
    @human_player = nil 
    @computer_player = nil
    @board = Board.new
  end

  def code_break_loop
    i = 0 
    loop do
      i += 1
      @board.input
      @board.win_check
      @board.exact_matches
      @board.relative_matches
      @board.display_storage
      break if i == 12 || @board.win_check === true
    end
  end

  def create_players #re-work for computer players
    print "Please enter your name: "
    name = gets.chomp.to_s
    @human_player = Player.new(name)
    puts @human_player.name
  end

  def game_loop
    create_players
    @board.code_creation
    code_break_loop
  end

end