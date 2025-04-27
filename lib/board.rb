
class Board
  all_colors = ["red","green","blue","yellow", "orange", "purple"]

  def initialize
    @peg_array = []
    @map_array = []
    @input_storage = nil
    @peg_array = nil
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
    puts "------------------------------"
    i = 1
    loop do
      if i <= 9
        puts "|  #{i} | #{@input_storage[i-1][0]} #{@input_storage[i-1][1]} #{@input_storage[i-1][2]} #{@input_storage[i-1][3]} | #{@peg_storage[i-1][0]} #{@peg_storage[i-1][1]} #{@peg_storage[i-1][2]} #{@peg_storage[i-1][3]} |"
      elsif i > 9
        puts "| #{i} | #{@input_storage[i-1][0]} #{@input_storage[i-1][1]} #{@input_storage[i-1][2]} #{@input_storage[i-1][3]} | #{@peg_storage[i-1][0]} #{@peg_storage[i-1][1]} #{@peg_storage[i-1][2]} #{@peg_storage[i-1][3]}  |"
      end
        i += 1
    break if i == @input_storage.length+1 || i == 13
    end
    puts "------------------------------"
  end

end