#include "Game.h"
#include <algorithm>
#include <random>

void Game::populateCards() {
    auto spades = new card::Suit(card::Suit::Type::Spades);
    auto hearts = new card::Suit(card::Suit::Type::Hearts);
    auto diamonds = new card::Suit(card::Suit::Type::Diamonds);
    auto clubs = new card::Suit(card::Suit::Type::Clubs);

    for (int i = 0; i < 13; ++i) {
        allCards.push_back(card::Card(i + 1, *spades));
        allCards.push_back(card::Card(i + 1, *hearts));
        allCards.push_back(card::Card(i + 1, *diamonds));
        allCards.push_back(card::Card(i + 1, *clubs));
    }

    delete spades;
    delete hearts;
    delete diamonds;
    delete clubs;

    shuffleCards();

    run();
}

void Game::shuffleCards() {
    std::random_device rd; // Gera uma seed aleatória
    std::mt19937 g(rd());  // Inicializa o gerador de números aleatórios

    std::shuffle(allCards.begin(), allCards.end(), g);

    const std::vector<card::Card> cards(allCards.begin(), allCards.begin() + 21);
    allCards = cards;
}

void Game::run() {
// TODO
}