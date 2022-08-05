package org.wendel;

import org.wendel.card.Card;
import org.wendel.card.Suit;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Main {

    public static void main(String[] args) {
        List<Card> allCards = populateCards();

        Game game = new Game(allCards);
    }

    private static List<Card> populateCards() {
        List<Card> allCards = new ArrayList<>();
        for(Suit suit : Suit.values()) {
            for(int i = 0; i < 13; i++) {
                allCards.add(new Card(i, suit));
            }
        }
        return Collections.unmodifiableList(allCards);
    }
}