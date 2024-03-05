require_relative 'deck'

class Game
    @all_cards
    @cycle

    def initialize(all_cards)
        @all_cards = all_cards.shuffle.take(21)
        @cycle = 0

        run
    end

    def run()
        while @cycle <= 2
            run_cycle
        end

        card_guessed = @all_cards[10]
        puts "The choosen card:" + card_guessed.to_s
    end

    def run_cycle()
        # binding.break
        deck = sort_to_columns
        puts deck.to_s

        choice = pick_card
        rejoin_cards(choice, deck)

        @cycle += 1
    end

    def pick_card()
        puts "choose a column: "
        choosen = gets.chomp
        puts "choosen: " + choosen
        choosen.to_i
    end

    def rejoin_cards(choice, deck)
        if choice == 1
            @all_cards.concat(deck.col2)
            @all_cards.concat(deck.col1)
            @all_cards.concat(deck.col3)
        elsif choice == 2
            @all_cards.concat(deck.col1)
            @all_cards.concat(deck.col2)
            @all_cards.concat(deck.col3)
        elsif choice == 3
            @all_cards.concat(deck.col1)
            @all_cards.concat(deck.col3)
            @all_cards.concat(deck.col1)
        end
    end

    def sort_to_columns()
        col1 = []
        col2 = []
        col3 = []

        index = -1
        @all_cards.each do |card|
            index += 1
            if index == 0 
                col1.push(card)
            elsif index == 1
                col2.push(card)
            elsif index == 2
                col3.push(card)
                index = -1
            end
        end
        
        @all_cards = []

        Deck.new(col1, col2, col3)
    end

    def to_s()
        all_string = ''
        @all_cards.each do |card|
            all_string += card.to_s + "\n"
        end
        all_string
    end

end
