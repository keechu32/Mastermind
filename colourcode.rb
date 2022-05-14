class ColourCode
    attr_accessor :colours, :selected_colours
    def initialize()
        @colours = [colour1, colour2, colour3, colour4]
    end
    def randomize_colour
        colour_choices= ["red","yellow","green","blue","black","purple"]
        randomize_colour = colour_choices.sample
        @selected_colours !!=[]
        until !@selected_colours.include?(randomize_colour)
            randomize_colour= colour_choices.sample
        end
        @selected_colours << randomize_colour
        randomize_colour
    end
end