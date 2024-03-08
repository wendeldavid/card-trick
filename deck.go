package main

import "fmt"

type deck struct {
	col1 []card
	col2 []card
	col3 []card
}

func (d deck) getColumn(index int) []card {
	if index == 0 {
		return d.col1
	}
	if index == 1 {
		return d.col2
	}
	if index == 2 {
		return d.col3
	}

	return []card{}
}

func (d deck) String() string {
	const separator = "---------------" + "\n"

	allStrings := separator
	allStrings += " c1 |  c2 |  c3" + "\n"
	allStrings += separator

	for i := 1; i < len(d.col1); i++ {
		card1 := d.col1[i]
		card2 := d.col2[i]
		card3 := d.col3[i]

		allStrings += fmt.Sprintf("%v | %v | %v", card1, card2, card3)

		allStrings += "\n"
	}

	allStrings += separator

	return allStrings
}
