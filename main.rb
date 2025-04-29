require 'colorize'
require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/players'
require_relative 'lib/computer_board'

game = Game.new

#game.game_loop
# Final step was updating the exact match function to run both exact and relative matches as a single opp and update
# white and red pegs
#
#new = Computer_Board.new
#new.code_creation
#new.code_break
#
board = Board.new
board.code_creation
board.input
board.exact_matches