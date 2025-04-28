require_relative "module_test"

class Game

  include Board_test #move back to board
  
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
    @board = nil # set this to @board = board.new
    @map_array = []
    @peg_array = []
  end

  def code_creation # keep on game side of things
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
  end

  def win_check
    if @code_array == @input_array 
      @win_trigger = 1
      return puts "Congratulations! You have cracked the code!"
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
  end
    puts "Total number of white pegs (relative matches) is: #{@white_pegs-@red_pegs}"
  end
  
  def code_break_loop
    i = 0 
    loop do
      i += 1
      input_guess
      win_check
      exact_matches
      relative_matches
      display_storage
      break if i == 12 || @win_trigger == 1
    end
  end

  def create_players
    print "Please enter your name: "
    name = gets.chomp.to_s
    @player = Player.new(name)
    puts @player.name
  end

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

  def peg_to_display
    @peg_array = []
    @white_pegs = @white_pegs - @red_pegs # this seems to be breaking red and white pegs
    @red_pegs.times do
      @peg_array << " ".on_red
    end
    @white_pegs.times do
      @peg_array << " ".on_white
    end
    (4 - @white_pegs - @red_pegs).times do
      @peg_array << " "
    end
  end

  def display_storage
    array_to_display
    @input_storage << @map_array
    peg_to_display
    @peg_storage << @peg_array
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