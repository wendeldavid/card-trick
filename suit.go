package main

const (
	spades   = "\u2660"
	clubs    = "\u2663"
	hearts   = "\u2665"
	diamonds = "\u2666"
)

var suits = []string{spades, clubs, hearts, diamonds}

func getSuits() []string {
	return suits
}
