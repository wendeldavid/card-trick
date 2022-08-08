package org.wendel.deck

import org.wendel.card.Card
import java.util.*
import java.util.stream.Collectors

class Deck(private val col1: Stack<Card>, private val col2: Stack<Card>, private val col3: Stack<Card>) {
    fun getColumn(i: Int): List<Card> {
        var column: Stack<Card>? = null
        column = if (i == 1) {
            col1
        } else if (i == 2) {
            col2
        } else if (i == 3) {
            col3
        } else {
            throw RuntimeException("invalid choice: $i")
        }
        return column.stream()
                .collect(Collectors.toList())
    }

    override fun toString(): String {
        val sb = StringBuilder()
        val cols: Array<Stack<Card>> = arrayOf<Stack<Card>>(col1, col2, col3)
        sb.append("---------------").append("\n")
        sb.append(" c1").append(" |  ").append("c2").append(" | ").append(" c3").append("\n")
        sb.append("---------------").append("\n")
        for (i in col1.indices) {
            val card1 = cols[0][i]
            val card2 = cols[1][i]
            val card3 = cols[2][i]
            sb.append(card1).append(" | ").append(card2).append(" | ").append(card3)
            sb.append('\n')
        }
        sb.append("---------------").append("\n")
        return sb.toString()
    }
}