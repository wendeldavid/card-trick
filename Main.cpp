#include <iostream>
#include <vector>
#include <string>
#include "card/Suit.cpp" // Include the Suit.cpp file

class Main {
private:
    std::vector<Suit> suits; // Use the Suit class object
    std::vector<std::string> ranks = {"Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"};
    std::vector<std::string> deck;
public:
    Main() {
        // Initialize the deck of cards
        for (const auto& suit : suits) {
            for (const auto& rank : ranks) {
                deck.push_back(rank + " of " + suit.getSuit();
            }
        }
    }

    void printDeck() {
        for (const auto& card : deck) {
            std::cout << card << std::endl;
        }
    }
};


int main() {
    Main deck;
    deck.printDeck();

    return 0;
}
