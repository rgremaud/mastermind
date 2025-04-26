require 'colorize'
require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/players'
require_relative 'lib/module_test'


# Game Test
game = Game.new

#game.board_create
game.input_guess
game.display_storage
game.input_guess
game.display_storage


# Game board testing

#board = Board.new
# board.add_pegs
#board.display_board
# board.all_colors_hash