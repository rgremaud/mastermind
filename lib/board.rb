
class Board

def initialize
  @input_array = [] #game
  @input_storage = [] #board
  @peg_storage = [] #board
  @red_pegs = nil #game
  @white_pegs = nil #game
  @map_array = [] #game
  @peg_array = [] #game
end

def input
  print 'Please enter four colors: '
  input_string = gets.to_s
  @input_array = input_string.split(" ")
end

def display_board
  puts "--------------------------"
  i = 1
  loop do
    if i <= 9
      puts "|  #{i} | #{@input_storage[i-1][0]} #{@input_storage[i-1][1]} #{@input_storage[i-1][2]} #{@input_storage[i-1][3]} | #{@peg_storage[i-1][0]} #{@peg_storage[i-1][1]} #{@peg_storage[i-1][2]} #{@peg_storage[i-1][3]} |"
    elsif i > 9
      puts "| #{i} | #{@input_storage[i-1][0]} #{@input_storage[i-1][1]} #{@input_storage[i-1][2]} #{@input_storage[i-1][3]} | #{@peg_storage[i-1][0]} #{@peg_storage[i-1][1]} #{@peg_storage[i-1][2]} #{@peg_storage[i-1][3]} |"
    end
      i += 1
  break if i == @input_storage.length+1 || i == 13
  end
  puts "--------------------------"
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

end