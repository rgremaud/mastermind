require_relative "module_test"

class Game

  include Board_test
  
  def initialize
    @code_array = Array.new
    @all_colors = ["red", "green", "blue", "yellow", "orange", "purple"]
    @input_array = []
    @input_storage = []
    @peg_storage = []
    @win_trigger = 0
    @player = nil
    @red_pegs = nil
    @white_pegs = nil
    @board = nil
    @map_array
    @peg_array = [" ".white]
  end

  def code_creation # eventually needs a re-write for if computer or human sets code
    i = 0
    loop do
      @code_array << @all_colors.sample
      i += 1
      break if i == 4
    end
    puts "The code array is #{@code_array}"
  end

  def input_guess
    print 'Please enter four colors: '
    input_string = gets.to_s
    @input_array = input_string.split(" ")
    puts "You guessed #{@input_array}"
  end

  def win_check
    if @code_array == @input_array 
      @win_trigger = 1
      return puts "Wow! You win!"
    end
  end

  def exact_matches
    i = 0
    @red_pegs = 0
    loop do
      if @code_array[i] == @input_array[i]
        @red_pegs += 1
      end
      i += 1
      break if i == @code_array.length
      end
      puts "Total number of red pegs (exact matches) is: #{@red_pegs}"
  end

  def relative_matches
  i = 0
  @white_pegs = 0
  loop do
    if (@code_array.count(@input_array[i]) - @input_array.count(@input_array[i])) == 0
      @white_pegs += 1
    elsif (@code_array.count(@input_array[i]) - @input_array.count(@input_array[i])) > 0
      @white_pegs += @code_array.count(@input_array[i]) - @input_array.count(@input_array[i])
    end
    i += 1
    break if i == @code_array.length
    #@white_pegs = @red_pegs - @white_pegs work this into the display?
  end
    puts "Total number of white pegs (relative matches) is: #{@white_pegs}"
  end
  
  def code_break_loop
    i = 0 
    #red_pegs = 0
    loop do
      i += 1
      input_guess
      win_check
      exact_matches
      relative_matches
      break if i == 12 || @win_trigger == 1
    end
  end

  def create_players
    print "Please enter your name: "
    name = gets.chomp.to_s
    @player = Player.new(name)
    puts @player.name
    puts @player.testing
  end

  # moved from board to game - need to rework
  def array_to_display
    @map_array = @input_array.map do |color|
      if color == "red"
        color = "R".red
      elsif color == "blue"
        color = "B".blue
      elsif color == "orange"
        color = "O".light_red
      elsif color == "purple"
        color = "P".light_magenta
      elsif color == "green"
        color = "G".green
      elsif color == "yellow"
        color = "Y".yellow
      else
        color == color 
      end
    end
  end

  def display_storage
    puts "The current input array is #{@input_array}"
    array_to_display
    @input_storage << @map_array
    puts @input_storage
    self.display_board
  end

  def board_create
    @board = Board.new
  end

# General flow when a came starts
  # Create the players under Game class by referencing players class
  # code_creation triggers
  # Create a game_loop for 12 rounds
  # loop will 
  # 1 - ask user ot input a guess
  # 2 - Check for a win
  # 3 - Check for number of exact matches (red_pegs)
  # 4 - Check for number of relative matches (red_pegs - white_pegs)
  # 5 - Add the current rounds input in the input_storage R G B B
  # 6 - Add the pegs into peg storage
  # 7 - Publish the display board with inputs

def game_loop
  create_players
  board_create
  code_creation
  code_break_loop
end

end