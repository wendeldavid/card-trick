#ifndef CARD_H
#define CARD_H

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
    int getValue() const {
        return value;
    }

    Suit getSuit() const {
        return cardSuit;
    }
};

}

#endif //CARD_H
