
class Board

def initialize
  @all_colors = ["red", "green", "blue", "yellow", "orange", "purple"]
  @input_array = [] 
  @input_storage = [] 
  @peg_storage = [] 
  @red_pegs = nil 
  @white_pegs = nil 
  @map_array = [] 
  @peg_array = [] 
  @code_array = []
end

def input
  print 'Please enter four colors: '
  input_string = gets.downcase.to_s
  @input_array = input_string.split(" ")
end

def code_creation
  i = 0
  loop do
    @code_array << @all_colors.sample
    i += 1
    break if i == 4
  end
  puts "Code array is #{@code_array}"
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
  @red_pegs.times do
    @peg_array << "●".red
  end
  @white_pegs.times do
    @peg_array << "●".white
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
      color = "●".red
    elsif color == "blue"
      color = "●".blue
    elsif color == "orange"
      color = "●".light_red
    elsif color == "purple"
      color = "●".light_magenta
    elsif color == "green"
      color = "●".green
    elsif color == "yellow"
      color = "●".yellow
    else
      color == color 
    end
  end
end

def peg_matches
  i = 0
  x = 0
  @red_pegs = 0
  @white_pegs = 0
  loop do
    if @code_array[i] == @input_array[i]
       @red_pegs += 1
    end
    i += 1
  break if i == @code_array.length
  end
   
  loop do
    if (@code_array.count(@input_array[x]) - @input_array.count(@input_array[x])) == 0
      @white_pegs += 1
    elsif (@code_array.count(@input_array[x]) - @input_array.count(@input_array[x])) > 0
      @white_pegs += @code_array.count(@input_array[x]) - @input_array.count(@input_array[x])
    end
    x += 1
   break if x == @code_array.length
  end
  @white_pegs = @white_pegs - @red_pegs
  puts "The red pegs are #{@red_pegs} and the white pegs are #{@white_pegs}"
end


def win_check
  if @input_array == @code_array
    puts "Code has been cracked!"
    return true
  else
    false
  end
end

def you_lose
  puts "Sorry you lose!"
  puts "The code array was #{@code_array}"
end

end