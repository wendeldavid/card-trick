#pragma once
#include "Suit.hpp"

class Card {

public:

    Card(int rank, Suit suit); // Construtor
    virtual ~Card();

    int getRank() const;
    Suit getSuit() const;

private:

    int rank;
    Suit suit;

};
