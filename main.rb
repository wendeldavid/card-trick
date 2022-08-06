require_relative 'game'
require_relative 'card'
require_relative 'suit'

class Main
    def self.run
        all_cards = []

        for suit in Suit.all_suits do
            (1..12).each do |i|
                card = Card.new(i, suit)
                all_cards.push(card)
            end
        end

        game = Game.new(all_cards)
        puts game.to_s
           
    end
end

Main.run
