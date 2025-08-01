from suit import Suit
from card import Card
from game import Game

all_cards = []
for i in range(1, 14):
    all_cards.append(Card(i, Suit.SPADES))
    all_cards.append(Card(i, Suit.HEARTS))
    all_cards.append(Card(i, Suit.DIAMONDS))
    all_cards.append(Card(i, Suit.CLUBS))

game = Game(all_cards)
game.run()