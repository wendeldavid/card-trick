package org.wendel.card;

public class Card {

    private final int number;
    private final Suit suit;

    public Card(int number, Suit suit) {
        this.number = number;
        this.suit = suit;
    }

    public int getNumber() {
        return number;
    }

    public Suit getSuit() {
        return suit;
    }

    @Override
    public String toString() {
        return "Card{" +
                "number=" + number +
                ", suit=" + suit +
                '}';
    }
}
