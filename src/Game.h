#ifndef GAME_H
#define GAME_H

#include <vector>

#include "card/Card.h"
#include "deck/Deck.h"

class Game {
private:
    std::vector<card::Card> allCards;
    int cycle = 0;

    void shuffleCards();

    bool runCycle();

    static int pickCard();

    void rejoinCards(int choice, deck::Deck deck);

    deck::Deck sortToColumns();

public:
    void populateCards();

    [[nodiscard]] const std::vector<card::Card>& getAllCards() const {
        return allCards;
    }

    void run();

};



#endif //GAME_H
