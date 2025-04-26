module Board_test
  
  def display_board
    puts "------------------------------"
    i = 1
    loop do
      if i <= 9
        puts "|  #{i} | #{@input_storage[i-1][0]} #{@input_storage[i-1][1]} #{@input_storage[i-1][2]} #{@input_storage[i-1][3]} | #{@peg_array[0]} #{@peg_array[0]} #{@peg_array[0]} #{@peg_array[0]} |"
      elsif i > 9
        puts "| #{i} | #{@input_storage[i-1][0]} #{@input_storage[i-1][1]} #{@input_storage[i-1][2]} #{@input_storage[i-1][3]} | #{@peg_array[0]} #{@peg_array[0]} #{@peg_array[0]} #{@peg_array[0]} |"
      end
        i += 1
    break if i == @input_storage.length+1 || i == 13
    end
    puts "------------------------------"
  end


end