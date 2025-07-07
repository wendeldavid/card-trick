#include "Deck.h"

namespace deck {
    Deck::Deck(std::stack<card::Card> col1, std::stack<card::Card> col2, std::stack<card::Card> col3)
        : col1(std::move(col1)), col2(std::move(col2)), col3(std::move(col3)) {
    }
}