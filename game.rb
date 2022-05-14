require 'colourize'

class GameBoard
    attr_accessor :solution, :guesses, :feedback
    def initialize
        @solution = ColourCode.new()
        @guesses = Array.new(12, ColourCode.new("white", "white", "white", "white"))
        @feedback = Array.new(12, Feedback.new("white","white","white","white"))
    end
    def display
        puts "___________________________"
        @guesses.each_with_index{ |guess, index| puts "| #{colourize(guess, true)} | #{colourize(@feedback[index],false)} |" }
        puts "---------------------------"
    end
    def refresh(row_index)
        eval(row_index)
        display
    end
    def eval
        correct_guess=0
        @guesses[row_index].colours.each_with_index{|colour, index| correct_guess+=1 if @solution.colours[index]==colour}
        misplaced_correct_guess = @guesses[row_index].colours.select {|colour| @solution.colours.include?(colour)==true}.uniq.length - correct_guess

        colours = []

        correct_guess.times do
            colours << "green"
        end

        misplaced_correct_guess.times do
            colours << "red"
        end

        until colours.length == 4
            colours << "white"
        end
        @feedback[row_index] = Feedback.new(colours[0], colours[1], colours[2], colours[3])
    end
    def colourize(set, is_colour_code)
        colours = Array.new
        text = is_colour_code ? "O" : "."
        set.colours.each{ |colour| colour.push(text.public_send(colour.to_sym))}
        colours.join(" ")
    end
end