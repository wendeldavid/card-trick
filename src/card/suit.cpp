enum ESuit: unsigned char {
    Hearts = 'H',
    Diamonds = 'D',
    Clubs = 'C',
    Spades = 'S'
};

class Suit {
    public:
        Suit(ESuit suit);
        virtual ~Suit();
        ESuit getSuit() const;

    private:
};
