#ifndef SUIT_H
#define SUIT_H

#include <string>

namespace card {

class Suit {
public:
    enum class Type {
        Hearts,
        Diamonds,
        Clubs,
        Spades
    };
    Suit() = default;

    explicit Suit(const Type t) : type(t) {}

    [[nodiscard]] Type getType() const {
        return type;
    }

    static std::string toString(const Type type) {
        switch (type) {
            case Type::Hearts: return "♥";
            case Type::Diamonds: return "♦";
            case Type::Clubs: return "♣";
            case Type::Spades: return "♠";
            default: return "�";
        }
    }

private:
    Type type;
};

} // card

#endif //SUIT_H
