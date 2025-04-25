
class Board
  all_colors = ["red","green","blue","yellow", "orange", "purple"]

  def initialize
    @array = ["R".red, "B".blue, "G".green, "P".light_magenta]
    @red_pegs = 2
    @white_pegs = 2
    @map_array = []
  end

  def array_to_display
    input_array = @display_array
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
    puts "+------------------+"
    puts "|#{@map_array[0]} #{@map_array[1]} #{@map_array[2]} #{@map_array[3]} |1 1 1 1 |"
    puts @maps_array
  end

end