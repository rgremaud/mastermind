class Gameboard
  # build initial gameboard
  def initialize
    @code_array = Array.new
    @all_colors = ["red", "green", "blue", "yellow", "orange", "purple"]
    @color_match_index_match = 0
    @color_match = 0
    @input_array = []
    @win_trigger = 0
  end
  
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

  def array_compare
    i = 0 
    loop do
      i += 1
      input_guess
      win_check
      break if i == 12 || @win_trigger == 1
    end
    # run a loop to request color_guess 12 times and compare with code_array
    # if all four match, game is over and you win
    # elsif color matches and index number matches, add to color_match_index_match
    # compare with code_array[1] == input_array[1] etc
    # elsif color matches and index number doesn't match, add to color_match 
    # compare with code_array.include(input_array[0])
    # This method may duplicate, so items will tabulate on both options
    # Solution is to subtract number of exact matches from color matches
    # 
    # input_array.each do |color|
    # include_count += 1 if code_array.include?(color)
    # end
    # 
    
  end

end