from typing import List
from card import Card

class Deck:

    col1: List[Card]
    col2: List[Card]
    col3: List[Card]

    def __init__(self, col1: List[Card], col2: List[Card], col3: List[Card]):
        self.col1 = col1
        self.col2 = col2
        self.col3 = col3

    def __str__(self):
        output = "---------------\n"
        output = output + " c1 |  c2 |  c3 \n"
        output = output + "===============\n"

        for i in range(len(self.col1)):
            card1 = self.col1[i]
            card2 = self.col2[i]
            card3 = self.col3[i]
            output = output + f"{card1} | {card2} | {card3}\n"

        output = output + "---------------\n"
        return output
