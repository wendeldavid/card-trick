package main

import (
	"bufio"
	"fmt"
	"math/rand"
	"os"
	"strconv"
	"strings"
	"time"
)

type game struct {
	allCards []card
	cycle    int
}

func (g *game) start(allCards []card) {
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

func (g *game) run() {
	for {
		if !g.runCycle() {
			break
		}
	}

	cardGuessed := g.allCards[10]
	fmt.Printf("Your card is: %v\n", cardGuessed)
}

func pickCard() int {
	reader := bufio.NewReader(os.Stdin)
	fmt.Print("Choose you column: ")

	choose, _ := reader.ReadString('\n')
	choose = strings.TrimSuffix(choose, "\n")
	chooseInt, _ := strconv.Atoi(choose)

	return chooseInt
}

func (g *game) runCycle() bool {
	deck := g.sortToColumns()

	choice := pickCard()

	g.rejoinCards(choice, deck)

	g.cycle++
	return g.cycle <= 2
}

func (g *game) rejoinCards(choice int, deck deck) {
	if choice == 1 {
		g.allCards = append(g.allCards, deck.col2...)
		g.allCards = append(g.allCards, deck.col1...)
		g.allCards = append(g.allCards, deck.col3...)
	} else if choice == 2 {
		g.allCards = append(g.allCards, deck.col1...)
		g.allCards = append(g.allCards, deck.col2...)
		g.allCards = append(g.allCards, deck.col3...)
	} else if choice == 3 {
		g.allCards = append(g.allCards, deck.col1...)
		g.allCards = append(g.allCards, deck.col3...)
		g.allCards = append(g.allCards, deck.col2...)
	}
}

func (g *game) sortToColumns() deck {
	col1 := []card{}
	col2 := []card{}
	col3 := []card{}

	i := -1
	for _, c := range g.allCards {
		i += 1

		if i == 0 {
			col1 = append(col1, c)
		} else if i == 1 {
			col2 = append(col2, c)
		} else {
			col3 = append(col3, c)
			i = -1
		}
	}
	g.allCards = []card{}

	deck := deck{col1, col2, col3}
	fmt.Print(deck)
	return deck
}
