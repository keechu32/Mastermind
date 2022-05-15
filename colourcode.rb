class ColourCode
    attr_accessor :colours, :selected_colours
    def initialize(colour1=randomize_colour,colour2=randomize_colour,colour3=randomize_colour,colour4=randomize_colour)
        @colours= [colour1, colour2, colour3, colour4]
    end
    def randomize_colour
        colour_choices= ["red", "green", "yellow", "blue", "black", "magenta", "cyan", "white"]
        randomize_colour = colour_choices.sample
        @selected_colours ||=[]
        until !@selected_colours.include?(randomize_colour)
            randomize_colour= colour_choices.sample
        end
        @selected_colours << randomize_colour
        randomize_colour
    end
end