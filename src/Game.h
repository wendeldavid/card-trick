#ifndef GAME_H
#define GAME_H

#include <array>
#include <vector>

#include "card/Card.h"

class Game {
private:
    std::vector<card::Card> allCards;
    int cycle = 0;

    void shuffleCards();
public:
    void populateCards();

    const std::vector<card::Card>& getAllCards() const {
        return allCards;
    }

    void run();


};



#endif //GAME_H
