package org.wendel;

import org.wendel.card.Card;
import org.wendel.deck.Deck;

import java.util.Collections;
import java.util.List;
import java.util.Scanner;
import java.util.Stack;
import java.util.stream.Collectors;

public class Game {

    private final List<Card> allCards;

    private int cycle = 0;

    public Game(List<Card> allCards) {
        List<Card> cards = allCards;
        Collections.shuffle(cards);
        this.allCards = cards.stream()
                .limit(21)
                .collect(Collectors.toList());

        run();
    }

    public void run() {
        while (runCycle()) {
        }
        Card cardGuessed = allCards.get(11);
        System.out.println("The chosen card: " + cardGuessed);
    }

    private int pickCard() {
        Scanner keyboard = new Scanner(System.in);
        System.out.println("choose a column: ");
        int choice = keyboard.nextInt();
        System.out.println("escolha: " + choice);
        return choice;
    }

    private boolean runCycle() {
        Deck deck = sortToColumns();

        int choice = pickCard();

        rejoinCards(choice, deck);

        return cycle++ < 2;
    }

    private void rejoinCards(int choice, Deck deck) {
        if (choice == 1) {
            allCards.addAll(deck.getColumn(2));
            allCards.addAll(deck.getColumn(1));
            allCards.addAll(deck.getColumn(3));
        } else if (choice == 2) {
            allCards.addAll(deck.getColumn(1));
            allCards.addAll(deck.getColumn(2));
            allCards.addAll(deck.getColumn(3));
        } else if (choice == 2) {
            allCards.addAll(deck.getColumn(1));
            allCards.addAll(deck.getColumn(3));
            allCards.addAll(deck.getColumn(2));
        }
    }

    private Deck sortToColumns() {
        Stack<Card> col1 = new Stack<>();
        Stack<Card> col2 = new Stack<>();
        Stack<Card> col3 = new Stack<>();

        int i = -1;
        for (Card card : allCards) {
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

        Deck deck = new Deck(col1, col2, col3);
        System.out.println(deck);
        return deck;
    }

}
