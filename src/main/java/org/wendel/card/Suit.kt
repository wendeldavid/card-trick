package org.wendel.card

enum class Suit(val suitCode: String) {
    SPADES("\u2660"), CLUBS("\u2663"), HEARTS("\u2665"), DIAMOND("\u2666");

    override fun toString(): String {
        return suitCode
    }
}