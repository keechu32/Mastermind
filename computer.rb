class Computer
    attr_accessor :colour_choices, :guess_set, :correct_guess
    def initialize
        @colour_choices = ["red", "green", "yellow", "blue", "black", "magenta", "cyan", "white"]
        @guess_set = 0
        @correct_guess = Array.new()
    end
    def guess(feedback, turn)
        computer_guess = get_guess(feedback, turn)
        puts computer_guess
        computer_guess
    end
    def get_guess(feedback, turn)
        computer_guess = []

        unless @correct_guess.uniq.length == 4
            case turn
            when 1
                4.times do
                    (computer_guess << colour_choices[@guess_set])
                end 

                @guess_set+=1
            when (2..8)
                4.times {computer_guess << colour_choices[@guess_set]}
                if feedback[12 - turn + 1].colours[0] == "green"
                    @correct_guess << @colour_choices[@guess_set - 1]
                end
                if guess_set<8
                    @guess_set+=1
                end
            when 9
                if feedback[12 - turn + 1].colours[0] == "green"
                    @correct_guess << @colour_choices[@guess_set - 1]
                end
                puts @correct_guess
                computer_guess = @correct_guess
                @correct_guess = @correct_guess.shuffle 
            else
                computer_guess = @correct_guess
                @correct_guess = @correct_guess.shuffle
            end
        computer_guess
        end
    end
    def colour_is_correct(feedback, turn)
        feedback[12 - turn + 1].colours[0] == "green"
    end
end