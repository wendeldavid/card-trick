build:
	@rm -f Main
	@g++ src/Main.cpp src/Game.cpp src/Deck.cpp src/card/Card.cpp src/card/Suit.cpp -o Main
	@echo "Build Successfull!"

run:
	./Main