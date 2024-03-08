package main

import "fmt"

type card struct {
	number int
	suit   string
}

func (c card) String() string {
	return fmt.Sprintf("%d%s", c.number, c.suit)
}
