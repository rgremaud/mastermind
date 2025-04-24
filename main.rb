require 'colorize'
require_relative 'lib/gameboard'
require_relative 'lib/players'



game = Gameboard.new

game.code_creation

game.input_guess

game.exact_matches

#game.win_check

#game.array_compare