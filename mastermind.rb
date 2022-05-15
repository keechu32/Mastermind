require_relative 'game.rb'
require_relative 'colourcode.rb'
require_relative 'feedback.rb'
require_relative 'computer.rb'

class Mastermind
    attr_accessor :gameboard, :win, :turns, :colour_choices, :player_mode, :computer
    def initialize
        @gameboard = GameBoard.new()
        @win = false
        @turns = 1
        @colour_choices = ["red", "green", "yellow", "blue", "black", "magenta", "cyan", "white"]
        @computer = Computer.new()
        @player_mode = true
    end
    def play_game
        instructions
        prompt_switch_mode
        if @player_mode == false
            set_solution
        end
        start
    end
    def instructions
        puts "  __  __             _                     _           _ 
 |  \\/  | __ _  ___| |_  ___  _ _  _ __  (_) _ _   __| |
 | |\\/| |/ _` |(_-<|  _|/ -_)| '_|| '  \\ | || ' \\ / _` |
 |_|  |_|\\__,_|/__/ \\__|\\___||_|  |_|_|_||_||_||_|\\__,_|"
        puts "___________________________________________\n"
        puts "Guess the correct code to win!"
        puts "The computer will set the code with 4 colours in a specific order."
        puts "Solve it in 12 tries to win!"
        @gameboard.display
        puts "___________________________________________\n"
        puts "The left side will show your guesses whereas the right side shows accuracy of the guesses"
        puts "Green indicates colour in correct position and red indicates wrong position"
        puts "\nGood Luck!"
        puts "___________________________________________\n"
    end
    def prompt_switch_mode
        puts "Do you want to set the code or guess the code?"
        puts "Type \"set\" and hit enter to set and \"guess\" and hit enter to guess"
        mode = gets.chomp 
        until mode == "set" || mode == "guess"
            puts "Please enter only \"set\" or \"guess\""
            mode = gets.chomp
        end
        if mode == "set"
            @player_mode = false
        end
    end
    def set_solution
        puts "What would you like your solution to be?"
        puts "Please enter the colours one by one seperated by space in the order you want them"
        puts "your options are red, yellow, green, blue, black, magenta, cyan, white\n\n\n"
        solution = get_player_guesses
        @gameboard.solution = ColourCode.new(solution[0], solution[1], solution[2], solution[3])
    end
    def get_player_guesses
        1.times do
            guess = gets.chomp.downcase.split(" ")
            unless guess.length == 4
                puts "You entered the wrong amount of colours, please try again"
                redo
            end
            guess.each do |guess_|
                if !(@colour_choices.include? (guess_))
                    puts "You can only enter the colours mentioned"
                    redo
                end 
            end
            if @player_mode == false
                if guess.uniq.length != 4
                    puts "You must have different colours for the solution"
                    redo
                end 
            end
            return guess
        end
    end
    def start
        make_guesses
        turns > 12 ? lose : win
    end
    def make_guesses
        while @win == false && @turns < 13
            prompt_guess
            guess = @player_mode ? get_player_guesses : computer_guess
            add_guess(guess)
            @win = true if gameboard.guesses[12-@turns].colours == gameboard.solution.colours
            @turns+=1 if @win == false
        end
    end
    def prompt_guess
        puts @player_mode ? "What is your ##{@turns} guess?" : "\nComputer, make your ##{@turns} guess."
		puts "Type four colours separated by spaces."
        puts "your options are red, yellow, green, blue, black, magenta, cyan, white"
    end
    def computer_guess
        @computer.guess(@gameboard.feedback, @turns)
    end
    def add_guess(guess)
        index_of_gameboard = 12 - @turns
        gameboard.guesses[index_of_gameboard] = ColourCode.new(guess[0], guess[1], guess[2], guess[3])
        gameboard.refresh(index_of_gameboard)
    end
    def lose
        puts @player_mode ? "\nYou lost the game dumbass, maybe this isnt for you" : "\nOopsie I let you win"
        puts "The solution was #{@gameboard.solution.colours}."
    end
    def win
        puts @player_mode ? "\nYou are a Genius! You solved it!" : "\nPfft this was ezz, next I am coming to destroy you"
    end
end
 game = Mastermind.new()
 game.play_game