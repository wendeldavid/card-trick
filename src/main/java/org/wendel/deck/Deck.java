package org.wendel.deck;

import org.wendel.card.Card;

import java.util.Stack;

public class Deck {

    private final Stack<Card> col1;
    private final Stack<Card> col2;
    private final Stack<Card> col3;

    public Deck(Stack<Card> col1, Stack<Card> col2, Stack<Card> col3) {
        this.col1 = col1;
        this.col2 = col2;
        this.col3 = col3;
    }

}
