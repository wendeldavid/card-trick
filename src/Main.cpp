#include "Main.h"

#include <iostream>

#include "Game.h"

int main() {
    auto lang = "C++";

    auto * game = new Game();
    game->populateCards();
    std::vector<card::Card> cards = game->getAllCards();
    for (const auto &c : cards) {
        std::cout << "Card value: " << c.getValue() << ", Suit: " << card::Suit::toString(c.getSuit().getType()) << std::endl;
    }

    return 0;
}