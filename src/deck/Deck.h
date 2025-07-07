#ifndef DECK_H
#define DECK_H

#include <array>
#include <iostream>
#include <sstream>
#include <stack>
#include <stdexcept>
#include <vector>

#include "../card/Card.h"

namespace deck {

    class Deck {
    public:
        Deck(std::stack<card::Card> col1, std::stack<card::Card> col2, std::stack<card::Card> col3);

        std::vector<card::Card> getColumn(int const i) {
            std::stack<card::Card>* selectedCol = nullptr;

            if (i == 0) {
                selectedCol = &col1;
            } else if (i == 1) {
                selectedCol = &col2;
            } else if (i == 2) {
                selectedCol = &col3;
            } else {
                throw std::invalid_argument("Invalid choice. Use 1, 2, or 3.");
            }

            std::vector<card::Card> column;

            if (selectedCol) {
                while (!selectedCol->empty()) {
                    column.push_back(selectedCol->top());
                    selectedCol->pop();
                }
            }

            return column;
        }


        [[nodiscard]] std::string toString() const {
            std::ostringstream oss;

            std::stack<card::Card> c1 = col1;
            std::stack<card::Card> c2 = col2;
            std::stack<card::Card> c3 = col3;

            oss << "---------------\n";
            oss << " c1 |  c2 |  c3\n";
            oss << "---------------\n";
            while (!c1.empty()) {
                oss << c1.top().toString() << " | " << c2.top().toString() << " | " << c3.top().toString() << "\n";

                c1.pop();
                c2.pop();
                c3.pop();
            }

            oss << "---------------\n";

            return oss.str();
        }

    private:
        std::stack<card::Card> col1;
        std::stack<card::Card> col2;
        std::stack<card::Card> col3;


    };
} // deck

#endif //DECK_H
