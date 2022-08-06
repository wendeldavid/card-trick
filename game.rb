class Game
    @all_cards
    @cycle

    def initialize(all_cards)
        @all_cards = all_cards.shuffle.take(21)
        @cycle = 0
    end

    def run()
    end

    def run_cycle()
    end

    def pick_card()
    end

    def rejoin_cards()
    end

    def sort_do_columns()
    end

    def to_s()
        all_string = ''
        @all_cards.each do |card|
            all_string += card.to_s + "\n"
        end
        all_string
    end

end
