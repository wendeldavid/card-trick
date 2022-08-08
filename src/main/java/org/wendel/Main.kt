package org.wendel

import org.wendel.card.Card
import org.wendel.card.Suit

object Main {
    @JvmStatic
    fun main(args: Array<String>) {
        val allCards = populateCards()
        val game = Game(allCards)
    }

    private fun populateCards(): List<Card> {
        val allCards: MutableList<Card> = ArrayList()
        for (suit in Suit.values()) {
            for (i in 0..12) {
                allCards.add(Card(i, suit))
            }
        }
        return allCards
    }
}