class Game
  
  def initialize
    @code_array = Array.new
    @all_colors = ["red", "green", "blue", "yellow", "orange", "purple"]
    @color_match_index_match = 0
    @color_match = 0
    @input_array = []
    @win_trigger = 0
    @player = nil
  end
  
  # think about rewriting this so it flags based on if player is a computer or human
  # human would enter their code manually
  # computer would follow the below process
  def code_creation 
    i = 0
    loop do
      @code_array << @all_colors.sample
      i += 1
      break if i == 4
    end
    puts @code_array
  end

  def input_guess
    print 'Please enter four colors: '
    input_string = gets.to_s
    @input_array = input_string.split(" ")
    puts @input_array
  end

  def win_check
    if @code_array == @input_array 
      @win_trigger = 1
      return puts "Wow! You win!"
    end
  end

  def exact_matches
    i = 0
    red_pegs = 0
    loop do
      if @code_array[i] == @input_array[i]
        red_pegs += 1
      end
      i += 1
      break if i == @code_array.length
      end
      puts "Total number of red pegs (exact matches) is: #{red_pegs}"
  end

  def relative_matches
  i = 0
  white_pegs = 0
  loop do
    if (@code_array.count(@input_array[i]) - @input_array.count(@input_array[i])) == 0
      white_pegs += 1
    elsif (@code_array.count(@input_array[i]) - @input_array.count(@input_array[i])) > 0
      white_pegs += @code_array.count(@input_array[i]) - @input_array.count(@input_array[i])
    end
    i += 1
    break if i == @code_array.length
  end
    puts "Total number of white pegs (relative matches) is: #{white_pegs}"
  end
  
  def array_compare
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
    print "Please enter a name: "
    name = gets.chomp.to_s
    @player = Player.new(name)
    puts @player.name
  end

  # moved from board to game - need to rework
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
  
end