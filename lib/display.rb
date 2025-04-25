class Display < Gameboard
  def initialize
    @array = ["R".red, "B".blue, "G".green, "P".light_magenta]
    @all_colors = ["red", "green", "blue", "yellow", "orange", "purple"]
    @red_pegs = 2
    @white_pegs = 2
  end

  def display_board
    puts "+-----------------------------+"
    puts "|#{@array[0]} #{@array[1]} #{@array[2]} #{@array[3]} | |"
    a = "TEST".black.on_white
    puts a
  end

  def all_colors_hash
    all_colors_hash = {"red" => "R".red, "blue" => "B".blue, "yellow" => "Y".yellow,
     "orange" => "O".light_red, "purple" => "P".light_magenta}
     puts all_colors_hash["red"]
  end
  
end