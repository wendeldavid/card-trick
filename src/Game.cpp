#include "Game.h"
#include <algorithm>
#include <random>

void Game::populateCards() {
    const auto spades = new card::Suit(card::Suit::Type::Spades);
    const auto hearts = new card::Suit(card::Suit::Type::Hearts);
    const auto diamonds = new card::Suit(card::Suit::Type::Diamonds);
    const auto clubs = new card::Suit(card::Suit::Type::Clubs);

    for (int i = 0; i < 13; ++i) {
        allCards.emplace_back(i + 1, *spades);
        allCards.emplace_back(i + 1, *hearts);
        allCards.emplace_back(i + 1, *diamonds);
        allCards.emplace_back(i + 1, *clubs);
    }

    delete spades;
    delete hearts;
    delete diamonds;
    delete clubs;

    shuffleCards();
}

void Game::shuffleCards() {
    std::random_device rd; // Gera uma seed aleatória
    std::mt19937 g(rd());  // Inicializa o gerador de números aleatórios

    std::shuffle(allCards.begin(), allCards.end(), g);

    const std::vector<card::Card> cards(allCards.begin(), allCards.begin() + 21);
    allCards = cards;
}

void Game::run() {
    while (runCycle()) {
    }
    const card::Card cardGuessed = allCards.at(10);
    std::cout << "The chosen card: " << cardGuessed.toString() << std::endl;
}

bool Game::runCycle() {
    const deck::Deck deck = sortToColumns();

    const int choice = pickCard();

    rejoinCards(choice, deck);

    return cycle++ < 2;
}

void Game::rejoinCards(int choice, deck::Deck deck) {
    std::vector<card::Card> c1 = deck.getColumn(0);
    std::vector<card::Card> c2 = deck.getColumn(1);
    std::vector<card::Card> c3 = deck.getColumn(2);

    if (choice == 1) {
        while (!c2.empty()) {
            allCards.push_back(c2.back());
            // deck.getColumn(1).pop_back();
            c2.pop_back();
        }
        while (!c1.empty()) {
            allCards.push_back(c1.back());
            c1.pop_back();
        }
        while (!c3.empty()) {
            allCards.push_back(c3.back());
            c3.pop_back();
        }

    } else if (choice == 2) {
        while (!c1.empty()) {
            allCards.push_back(c1.back());
            c1.pop_back();
        }
        while (!c2.empty()) {
            allCards.push_back(c2.back());
            c2.pop_back();
        }
        while (!c3.empty()) {
            allCards.push_back(c3.back());
            c3.pop_back();
        }

    } else if (choice == 3) {
        while (!c1.empty()) {
            allCards.push_back(c1.back());
            c1.pop_back();
        }
        while (!c3.empty()) {
            allCards.push_back(c3.back());
            c3.pop_back();
        }
        while (!c2.empty()) {
            allCards.push_back(c2.back());
            c2.pop_back();
        }
    }
}

int Game::pickCard() {
    int choice;
    std::cout << "Escolha uma coluna (1, 2 ou 3): ";
    std::cin >> choice;

    while (choice < 1 || choice > 3) {
        std::cout << "Escolha inválida. Tente novamente: ";
        std::cin >> choice;
    }

    return choice;
}

deck::Deck Game::sortToColumns() {
    std::stack<card::Card> col1;
    std::stack<card::Card> col2;
    std::stack<card::Card> col3;

    int i = -1;
    for (const auto &card : allCards) {
        i++;
        if (i == 0) {
            col1.push(card);
        } else if (i == 1) {
            col2.push(card);
        } else {
            col3.push(card);
            i = -1;
        }
    }
    allCards.clear();

    deck::Deck deck = deck::Deck(col1, col2, col3);
    std::cout << deck.toString() << std::endl;
    return deck;
}