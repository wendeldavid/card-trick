build:
	@rm -f Main
	@g++ Main.cpp Game.cpp Deck.cpp card/Card.cpp card/Suit.cpp -o Main
	@echo "Build Successfull!"

run:
	./Main