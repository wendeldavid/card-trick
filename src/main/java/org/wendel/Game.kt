package org.wendel

import org.wendel.card.Card
import org.wendel.deck.Deck
import java.util.*
import java.util.stream.Collectors

class Game(allCards: List<Card>) {
    private val allCards: MutableList<Card>
    private var cycle = 0

    init {
        val cards = allCards
        Collections.shuffle(cards)
        this.allCards = cards.stream()
                .limit(21)
                .collect(Collectors.toList())
        run()
    }

    fun run() {
        while (runCycle()) {
        }
        val cardGuessed = allCards[10]
        println("The chosen card: $cardGuessed")
    }

    private fun pickCard(): Int {
        val keyboard = Scanner(System.`in`)
        println("choose a column: ")
        val choice = keyboard.nextInt()
        println("escolha: $choice")
        return choice
    }

    private fun runCycle(): Boolean {
        val deck = sortToColumns()
        val choice = pickCard()
        rejoinCards(choice, deck)
        return cycle++ < 2
    }

    private fun rejoinCards(choice: Int, deck: Deck) {
        if (choice == 1) {
            allCards.addAll(deck.getColumn(2))
            allCards.addAll(deck.getColumn(1))
            allCards.addAll(deck.getColumn(3))
        } else if (choice == 2) {
            allCards.addAll(deck.getColumn(1))
            allCards.addAll(deck.getColumn(2))
            allCards.addAll(deck.getColumn(3))
        } else if (choice == 3) {
            allCards.addAll(deck.getColumn(1))
            allCards.addAll(deck.getColumn(3))
            allCards.addAll(deck.getColumn(2))
        }
    }

    private fun sortToColumns(): Deck {
        val col1 = Stack<Card>()
        val col2 = Stack<Card>()
        val col3 = Stack<Card>()
        var i = -1
        for (card in allCards) {
            i++
            if (i == 0) {
                col1.push(card)
            } else if (i == 1) {
                col2.push(card)
            } else {
                col3.push(card)
                i = -1
            }
        }
        allCards.clear()
        val deck = Deck(col1, col2, col3)
        println(deck)
        return deck
    }
}