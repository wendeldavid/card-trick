class Card

    attr_reader :number, :suit
    
    def initialize(number, suit)
        @number = number
        @suit = suit
    end

    def to_s()
        prefix = ''
        if @number < 10 
            prefix = ' ' 
        end
        prefix + @number.to_s + @suit
    end

end
