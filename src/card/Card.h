#ifndef CARD_H
#define CARD_H

#include <string>

#include "Suit.h"

namespace card {

class Card {
public:
    Card(int value, Suit s);

    ~Card() = default;

private:
    int value;
    Suit cardSuit;

public:
    [[nodiscard]] int getValue() const {
        return value;
    }

    [[nodiscard]] Suit getSuit() const {
        return cardSuit;
    }

    [[nodiscard]] std::string toString() const {
        const auto prefix  = value < 10 ? " " : "";
        return prefix + std::to_string(value) + Suit::toString(cardSuit.getType());
    }
};

}

#endif //CARD_H
