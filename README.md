Building a mastermind game script

General rules and ideas

Initial  build to assume computer is code selector

1 - Computer to select code by assigning four pegs a random color
    Colors to choose from: 
        red, green, blue, yellow, orange and purple
        all colors = ["red","green","blue,"yellow","orange","purple"]
        example: [red,blue,blue,yellow] build with all_colors.sample(1) into a new array.  Using 4 doesn't include duplicates

2 - Code breaker tries to guess the code - 12 turns
    For each guess, return a white peg if one of the guesses is the correct color, but wrong hole
                    return a red peg if one of the guess is correct color, correct hole
                    order of white and red pegs does not matter



Classses:
Gameboard
Players (human and computer)

