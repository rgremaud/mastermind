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
    @perms = @perms.select { |perm| (exact_matches_pc(perm,@code_array) + relative_matches_pc(perm,@code_array)) > (@red_pegs + @white_pegs) }
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

  def exact_matches_pc(array1,array2)
    i = 0
    @red_pegs_perm = 0
    loop do
      if array1[i] == array2[i]
        @red_pegs_perm += 1
      end
      i += 1
      break if i == array2.length
    end
    return @red_pegs_perm
  end
  
  def relative_matches_pc(array1,array2)
    i = 0
    @white_pegs_perm = 0
    loop do
      if (array2.count(array1[i]) - array1.count(array1[i])) == 0
        @white_pegs_perm += 1
      elsif (array2.count(array1[i]) - array1.count(array1[i])) > 0
        @white_pegs_perm += array2.count(array1[i]) - array1.count(array1[i])
      end
      i += 1
    break if i == array2.length
    end
    return @white_pegs_perm
  end

end