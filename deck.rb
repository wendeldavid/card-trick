class Deck
    attr_reader :col1, :col2, :col3

    def initialize(col1, col2, col3)
        @col1 = col1
        @col2 = col2
        @col3 = col3
    end

    def to_s()
        all_strings = "---------------"
        all_strings += " c1 | c2 | c3  "
        all_strings += "---------------"
        
        all_strings += ""
        
        all_strings += "---------------"
    end
end