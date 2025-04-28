class Game
  
  def initialize
  
    @win_trigger = nil 
    @human_player = nil 
    @computer_player = nil
    @board = Board.new # This allows you to call functions on board, but not instance variables - Need to rework structure
    @code_array = Array.new 
    @all_colors = ["red", "green", "blue", "yellow", "orange", "purple"]
    @input_array
  end

  def code_creation # move to board
    i = 0
    loop do
      @code_array << @all_colors.sample
      i += 1
      break if i == 4
    end
    puts "The code array is #{@code_array}"
  end

  def input_guess
    @board.input
  end

  def win_check
    if @code_array == @input_array 
      @win_trigger = 1
      return puts "Congratulations! You have cracked the code!"
    end
  end

  def exact_matches
    i = 0
    board.red_pegs = 0
    loop do
      if board.code_array[i] == board.input_array[i]
        board.red_pegs += 1
      end
      i += 1
      break if i == board.code_array.length
      end
      puts "Total number of red pegs (exact matches) is: #{board.red_pegs}"
  end

  def relative_matches
  i = 0
  board.white_pegs = 0
  loop do
    if (board.code_array.count(board.input_array[i]) - board.input_array.count(board.input_array[i])) == 0
      board.white_pegs += 1
    elsif (board.code_array.count(board.input_array[i]) - board.input_array.count(board.input_array[i])) > 0
      board.white_pegs += board.code_array.count(board.input_array[i]) - board.input_array.count(board.input_array[i])
    end
    i += 1
    break if i == board.code_array.length
  end
    puts "Total number of white pegs (relative matches) is: #{board.white_pegs-board.red_pegs}"
  end
  
  def code_break_loop
    i = 0 
    loop do
      i += 1
      input_guess
      win_check
      exact_matches
      relative_matches
      board.display_storage
      break if i == 12 || @win_trigger == 1
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
  #board_create
  code_creation
  code_break_loop
end

end