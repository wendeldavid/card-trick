package org.wendel;

import org.wendel.card.Card;

import java.util.Collection;

public class Game {

    private final Collection<Card> allCards;

    private int cycle = 0;

    public Game(Collection<Card> allCards) {
        this.allCards = allCards;
    }

    public boolean runCycle() {
        return true;
    }

}
