import random
from typing import List

from card import Card
from deck import Deck


def pick_card():
    choice = int(input("Choose a column: "))
    print(f"escolha: {choice}")
    return choice


class Game:
    all_cards: List[Card]

    def __init__(self, all_cards: List[Card]):
        self.all_cards = all_cards
        random.shuffle(self.all_cards)
        self.all_cards = self.all_cards[:21]

        self.cycle = 0

    def run(self):
        while self.run_cycle():
            pass

        card_guessed = self.all_cards[10]
        print(f"The chosen card: {card_guessed}")

    def rejoin_cards(self, choice: int, deck: Deck):
        if choice == 1:
            self.all_cards.extend(deck.col2)
            self.all_cards.extend(deck.col1)
            self.all_cards.extend(deck.col3)

        elif choice == 2:
            self.all_cards.extend(deck.col1)
            self.all_cards.extend(deck.col2)
            self.all_cards.extend(deck.col3)

        elif choice == 3:
            self.all_cards.extend(deck.col1)
            self.all_cards.extend(deck.col3)
            self.all_cards.extend(deck.col2)

    def sort_columns(self):
        col1 = []
        col2 = []
        col3 = []

        i = -1
        for card in self.all_cards:
            i += 1
            if i == 0:
                col1.append(card)
            elif i == 1:
                col2.append(card)
            else:
                col3.append(card)
                i = -1

        self.all_cards.clear()

        deck = Deck(col1, col2, col3)
        print(deck)
        return deck

    def run_cycle(self):
        deck = self.sort_columns()

        choice = pick_card()

        self.rejoin_cards(choice, deck)

        print(deck)
        self.cycle += 1
        return self.cycle < 3
