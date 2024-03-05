class Deck
    attr_reader :col1, :col2, :col3

    def initialize(col1, col2, col3)
        @col1 = col1
        @col2 = col2
        @col3 = col3
    end

    def to_s()
        all_strings = "---------------\n"
        all_strings += " c1 |  c2 |  c3 \n"
        all_strings += "---------------\n"
        
        @col1.each_with_index do | col, col_index |
            card1 = @col1[col_index]
            card2 = @col2[col_index]
            card3 = @col3[col_index]
            
            all_strings += card1.to_s + " | " + card2.to_s + " | " + card3.to_s + "\n"
        end
        
        all_strings += "---------------\n"
    end
end