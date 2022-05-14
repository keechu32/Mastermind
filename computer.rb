class Computer
    attr_accessor :colour_choices, :guess_set, :correct_guess
    def initialize
        @colour_choices = ["red","yellow","green","blue","black","purple","cyan","orange"]
        @guess_set = 0
        @correct_guess = Array.new
    end
    def guess(feedback, turn)
        computer_guess = get_guess(feedback, turn)
        puts "#{computer_guess[0], computer_guess[1], computer_guess[2], computer_guess[3]}"
        computer_guess
    end
    def get_guess(feedback, turn)
        computer_guess = []

        unless @correct_guess.uniq.length == 4
            case turn
            when 1
                4.times {computer_guess << colour_choices[@guess_set]}

                @guess_set+=1
            when (2..8)
                4.times {computer_guess << colour_choices[@guess_set]}
                @correct_guess << @colour_choices[@guess_set - 1] if colour_is_correct(feedback, turn)
                @guess_set+=1 if guess_set<8
            when 9
                @correct_guess << @colour_choices[@guess_set - 1] if colour_is_correct(feedback, turn)
                computer_guess = @correct_guess
                @correct_guess = @correct_guess.shuffle 
            else
                computer_guess = @correct_guess
                @correct_guess = @correct_guess.shuffle
            end
        computer_guess
    end
    def colour_is_correct(feedback, turn)
        feedback[12 - turn + 1].colours[0] == "green"
    end
end