package main

const (
	spades   = "S"
	clubs    = "C"
	hearts   = "H"
	diamonds = "D"
)

var suits = []string{spades, clubs, hearts, diamonds}

func getSuits() []string {
	return suits
}
