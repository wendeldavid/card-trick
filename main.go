package main

func main() {
	allCards := populateCards()

	game := game{}
	game.start(allCards)
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
