
class Board
  all_colors = ["red","green","blue","yellow", "orange", "purple"]

  def initialize
    @array = ["R".red, "B".blue, "G".green, "P".light_magenta]
    @peg_array = []
    @map_array = []
  end

  def add_pegs
    white_pegs = 3
    i = 0
    loop do 
      @peg_array << " ".on_white
      i += 1
      break if i == white_pegs
    end
    puts @peg_array
  end

  def display_board
    # setting map array manually to adjust display
    @map_array = [" R ".red, " B ".blue, " O ".light_red, " P ".light_magenta]
    @peg_array = [" ".on_white," "," "," "]
    puts "------------------------------"
    i = 1
    loop do
      if i <= 9
        puts "|  #{i} |#{@map_array[0]} #{@map_array[1]} #{@map_array[2]} #{@map_array[3]} |#{@peg_array[0]} #{@peg_array[0]} #{@peg_array[0]} #{@peg_array[0]}|"
      elsif i > 9
        puts "| #{i} |#{@map_array[0]} #{@map_array[1]} #{@map_array[2]} #{@map_array[3]} |#{@peg_array[0]} #{@peg_array[0]} #{@peg_array[0]} #{@peg_array[0]}|"
      end
        i += 1
    break if i == 13
    end
    puts "------------------------------"
  end

end