require 'colourize'

class GameBoard
    attr_accessor :solution, :guesses, :feedback
    def initialize
        @solution = ColourCode.new()
        @guesses = Array.new(12, ColourCode.new("white", "white", "white", "white"))
        @feedback = Array.new(12, Feedback.new("white","white","white","white"))
    end
    def refresh
        
    end
    def eval
        
    end
    def colourize
        
    end
end