package org.wendel.card;

public enum Suit {

    SPADES("\u2660"),
    CLUBS("\u2663"),
    HEARTS("\u2665"),
    DIAMONDS("\u2666");

    private final String suitCode;

    Suit(String suitCode) {
        this.suitCode = suitCode;
    }

    public String getSuitCode() {
        return suitCode;
    }

    @Override
    public String toString() {
        return suitCode;
    }
}
