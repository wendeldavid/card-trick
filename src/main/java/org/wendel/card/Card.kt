package org.wendel.card

class Card(val number: Int, val suit: Suit) {

    override fun toString(): String {
        val prefix = if (number < 10) " " else ""
        return prefix + number + suit
    }
}