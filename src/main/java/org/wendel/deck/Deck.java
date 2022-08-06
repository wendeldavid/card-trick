package org.wendel.deck;

import org.wendel.card.Card;

import java.util.List;
import java.util.Stack;
import java.util.stream.Collectors;

public class Deck {

    private final Stack<Card> col1;
    private final Stack<Card> col2;
    private final Stack<Card> col3;

    public Deck(Stack<Card> col1, Stack<Card> col2, Stack<Card> col3) {
        this.col1 = col1;
        this.col2 = col2;
        this.col3 = col3;
    }

    public List<Card> getColumn(int i) {
        Stack<Card> column = null;

        if (i == 1) {
            column = col1;
        } else if (i == 2) {
            column = col2;
        } else if (i == 3) {
            column = col3;
        } else {
            throw new RuntimeException("invalid choice: " + i);
        }

        return column.stream()
                .collect(Collectors.toList());
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        Stack<Card>[] cols = new Stack[]{col1, col2, col3};
        sb.append("---------------").append("\n");
        sb.append(" c1").append(" |  ").append("c2").append(" | ").append(" c3").append("\n");
        sb.append("---------------").append("\n");
        for (int i = 0; i < col1.size(); i++) {
            Card card1 = cols[0].get(i);
            Card card2 = cols[1].get(i);
            Card card3 = cols[2].get(i);

            sb.append(card1).append(" | ").append(card2).append(" | ").append(card3);
            sb.append('\n');
        }
        sb.append("---------------").append("\n");
        return sb.toString();
    }
}
