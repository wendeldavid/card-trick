from suit import Suit

class Card:

    def __init__(self, value: Suit, suit: Suit):
        self.value = value
        self.suit = suit

    def __str__(self):
        prefix = " " if self.value < 10 else ""

        return  f"{prefix}{self.value}{self.suit.value}"
