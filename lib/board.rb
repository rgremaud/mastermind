
class Board
  all_colors = ["red","green","blue","yellow", "orange", "purple"]

  def initialize
    @array = ["R".red, "B".blue, "G".green, "P".light_magenta]
    @red_pegs = 2
    @white_pegs = 2
    @map_array = []
  end

  def array_to_display
    @map_array = @display_array.map do |color|
      if color == "red"
        color = "R".red
      elsif color == "blue"
        color = "B".blue
      elsif color == "orange"
        color = "O".light_red
      elsif color == "purple"
        color = "P".light_magenta
      else
        color == color 
      end
    end
  end

  def display_board
    # setting map array manually to adjust display
    @map_array = [" R ".red, " B ".blue, " O ".light_red, " P ".light_magenta]
    peg_array = [" ".on_white," "," "," "]
    puts "------------------------------"
    i = 1
    loop do
      if i <= 9
        puts "|  #{i} |#{@map_array[0]} #{@map_array[1]} #{@map_array[2]} #{@map_array[3]} |#{peg_array[0]} #{peg_array[0]} #{peg_array[0]} #{peg_array[0]}|"
      elsif i > 9
        puts "| #{i} |#{@map_array[0]} #{@map_array[1]} #{@map_array[2]} #{@map_array[3]} |#{peg_array[0]} #{peg_array[0]} #{peg_array[0]} #{peg_array[0]}|"
      end
        i += 1
    break if i == 13
    end
    puts "------------------------------"
  end

end