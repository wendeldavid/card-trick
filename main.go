package main

import "fmt"

func main() {
	allCards := populateCards()

	fmt.Print(allCards)
}

func populateCards() []card {
	allCards := []card{}

	for i := 1; i <= 12; i++ {
		for _, suite := range getSuits() {
			card := card{
				number: i,
				suit:   suite,
			}
			allCards = append(allCards, card)
		}
	}
	return allCards
}
