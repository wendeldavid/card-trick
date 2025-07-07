#include "Main.h"
#include "Game.h"

int main() {
    auto lang = "C++";

    auto * game = new Game();
    game->populateCards();
    game->run();

    return 0;
}