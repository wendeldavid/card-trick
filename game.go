package main

import (
	"fmt"
	"math/rand"
	"time"
)

type game struct {
	allCards []card
	cycle    int
}

func (g game) start(allCards []card) {
	g.allCards = allCards

	shuffle(g.allCards)
	g.allCards = g.allCards[:21]

	g.run()
}

func shuffle(cards []card) {
	source := rand.NewSource(time.Now().UnixNano())
	r := rand.New(source)

	for i := range cards {
		newPosition := r.Intn(len((cards)) - 1)
		cards[i], cards[newPosition] = cards[newPosition], cards[i]
	}
}

func (g game) run() {
	for {
		if !g.runCycle() {
			break
		}
	}

	cardGuessed := g.allCards[10]
	fmt.Printf("Your card is: %v", cardGuessed)
}

func pickCard() int {
	// TODO
	return 0
}

func (g game) runCycle() bool {
	deck := sortToColumns()

	choice := pickCard()

	rejoinCards(choice, deck)

	g.cycle++
	return g.cycle < 2
}

func rejoinCards(choice int, deck deck) {

}

func sortToColumns() deck {
	return deck{}
}
