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
  end

  def code_set
    print 'Please enter four colors: '
    code_string = gets.to_s
    @code_array = code_string.downcase.split(" ")
    puts "You have set the code array to #{@code_array}"
  end

  def code_break
    # See if you can write the code for this:
    # 1-  Create the set S of 1,296 possible codes {1111, 1112, ... 6665, 6666}.
    # 2 - Start with initial guess 1122. (Knuth gives examples showing that this algorithm using first guesses other than "two pair"; such as 1111, 1112, 1123, or 1234; does not win in five tries on every code.)
   #  Play the guess to get a response of colored and white key pegs.
   # 3 - If the response is four colored key pegs, the game is won, the algorithm terminates.
  # 4 - Otherwise, remove from S any code that would not give that response of colored and white pegs.
  # 5 The next guess is chosen by the minimax technique, which chooses a guess that has the least worst response score. 
  # In this case, a response to a guess is some number of colored and white key pegs, and the score of such a response is defined to be the number of codes in S that are still possible even after the response is known. The score of a guess is pessimistically defined to be the worst (maximum) of all its response scores. From the set of guesses with the best (minimum) guess score, select one as the next guess, choosing a code from S whenever possible. (Within these constraints, Knuth follows the convention of choosing the guess with the least numeric value; e.g., 2345 is lower than 3456. Knuth also gives an example showing that in some cases no code from S will be among the best scoring guesses and thus the guess cannot win on the next turn, yet will be necessary to assure a win in five.)
  # 6 -Repeat from step 3.
  end

end