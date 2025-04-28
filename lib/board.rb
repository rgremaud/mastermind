
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
  input_string = gets.to_s
  @input_array = input_string.split(" ")
end

def code_creation # move to board
  i = 0
  loop do
    @code_array << @all_colors.sample
    i += 1
    break if i == 4
  end
  puts "The code array is #{@code_array} - FOR TESTING REMOVE LATER"
  puts "The code master has set the code!" 
  puts "Your color options are red, green, blue, yellow, orange and purple."
  puts "When inputting a guess please enter four colors seperated by a space."
  puts "Example input: red blue green orange"
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

def win_check
  if @input_array == @code_array
    puts "Code has been cracked!"
    return true
  else
    false
  end
end

end