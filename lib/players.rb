class Player
  def initialize(name)
    @name = name
  end

  def name
    "Good luck breaking the code, #{@name}!"
  end

  def testing
    puts "current input array is #{@input_array}"
  end

end