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
    @red_pegs_perm = nil
    @white_pegs_perm = nil
  end

  def code_set
    print 'Please enter four colors: '
    code_string = gets.to_s
    @code_array = code_string.downcase.split(" ")
    puts "You have set the code array to #{@code_array}"
  end

  def code_break
    @all_colors.repeated_permutation(4) {|perm| @perms.push(perm)}
    puts "Length is #{@perms.length}"
   # run your first code guess as red red blue blue
    @input_array = ["red","red","blue","blue"]
  # calculate numbers of white and red pegs - not working
    peg_matches
   #i = 0
   #loop do
  @perms = @perms.select { |perm| peg_matches_pc(perm) > (@red_pegs + @white_pegs) }
  puts "Perm length is #{@perms.length}"
    #@input_array = @perms[0]
    #p "New input array is #{@input_array}"
    #exact_matches
    #relative_matches
    #puts "Loop trigger is #{@perms.length}"
    #i += 1
    #break if i <= 12 || @input_array == @code_array
    #end
   # pick the first element in the perm array and re-run as a loop
  end

  def peg_matches_pc(perm_array)
    red_pegs = 0
    white_pegs = 0
  
    @code_array.each_with_index { |color, index| @red_pegs += 1 if color == perm_array[index] }

    code_counts = @code_array.reduce(Hash.new(0)) do |color, count|
      color[count] += 1
      color
    end

    perm_counts = perm_array.reduce(Hash.new(0)) do |color, count|
      color[count] += 1
      color
    end

    code_counts.sum do |color, count|
      white_pegs += [count, perm_counts[color]].min
    end

    white_pegs = white_pegs - red_pegs
    total_pegs = white_pegs + red_pegs
  end

end