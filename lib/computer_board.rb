class Computer_Board < Board
  
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
    @perms = []
  end

  def code_set
    print 'Please enter four colors: '
    code_string = gets.to_s
    @code_array = code_string.downcase.split(" ")
    puts "You have set the code array to #{@code_array}"
  end

  def code_break_pc
    i = 0
    @all_colors.repeated_permutation(4) {|perm| @perms.push(perm)}
    @input_array = ["red","red","blue","blue"]
    peg_matches 
    display_storage
    loop do 
      @perms = @perms.select { |perm| peg_matches_pc(perm) > (@white_pegs + (@red_pegs*2))}
      @input_array = @perms[0]
      peg_matches
      puts "New input array is #{@input_array}"
      display_storage_pc
      i += 1
    break if @input_array == @code_array || i == 12
    display_storage_pc
    end
  end

  def peg_matches_pc(perm_array)
    red_pegs = 0
    white_pegs = 0
    all_items = []
  
    @code_array.each_with_index { |color, index| red_pegs += 1 if color == perm_array[index] }

    all_items = @input_array + @code_array
    all_items.uniq!
  
    all_items.each_index do |index|
      white_pegs += [perm_array.count(all_items[index]), @code_array.count(all_items[index])].min
    end

    white_pegs = white_pegs - red_pegs
    white_pegs = white_pegs
    red_pegs = red_pegs
    total_peg_score = white_pegs + (red_pegs*2)
    return total_peg_score
  end

  def display_storage_pc
    array_to_display
    @input_storage << @map_array
    peg_to_display
    @peg_storage << @peg_array
    self.display_board
  end

end