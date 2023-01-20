var allCards = new Array(new Array());

var stackDeck = new Array();

var deck = new Array(new Array());

var cycle = 0;


detectLanguage = function() {
    var lang = navigator.language;
    if (lang.toLowerCase().startsWith("en")) {
        document.getElementById("instructions_title").innerHTML = "Instructions";
        
        document.getElementById("instructions_l1").innerHTML = "choose your card";
        document.getElementById("instructions_l2").innerHTML = "click or touch over the column that your card is in";
        document.getElementById("instructions_l3").innerHTML = "repeat the 2 more times";
        document.getElementById("instructions_l4").innerHTML = "I will pick up the card that you choose in your head!";
        document.getElementById("result_text").innerHTML = "Your choice was";
    }
}

populateCards = function() {

    for (var i = 0; i < 4; i++) {
        for (var j = 0; j < 13; j++) {

            // console.log("i=" + i + ", j=" + j);

            switch (i) {
                //spaces
                case 0 : {
                    allCards[i][j] = 's' + j;
                    break;
                }
                // hearts
                case 1 : {
                    allCards[i][j] = 'h' + j;
                    break;
                }
                // clubs
                case 2 : {
                    allCards[i][j] = 'c' + j;
                    break;
                }
                // diamonds
                case 3 : {
                    allCards[i][j] = 'd' + j;
                    break;
                }
            }
        }
        allCards.push(new Array());
    }
}

pickCards = function() {
    var cardsToPlace = [];

    for (var i = 0; i < 4; i++) {
        for (var j = 0; j < 13; j++) {
            cardsToPlace.push(allCards[i][j]);
        }
    }
    stackDeck = shuffle(cardsToPlace).slice(0,21);
}

sort = function() {

    for (var line = 0; line < 7; line++) {
        for (var col = 0; col < 3; col++) {

            if (deck.length <= col) {
                deck.push(new Array());
            }

            deck[col][line] = stackDeck.pop();
        }
    }
}

restack = function(colSelected) {

    if (colSelected === 0) {
        deck.unshift(deck.pop());
    } else if (colSelected === 2) {
        deck.push(deck.shift());
    }

    stack();

    sort();

    printDeck();

    processCycle();
}

stack = function() {
    stackDeck = [].concat(deck[0], deck[1], deck[2]);
}

shuffle = function(array) {
    var currentIndex = array.length, temporaryValue, randomIndex;

    // While there remain elements to shuffle...
    while (0 !== currentIndex) {

        // Pick a remaining element...
        randomIndex = Math.floor(Math.random() * currentIndex);
        currentIndex -= 1;

        // And swap it with the current element.
        temporaryValue = array[currentIndex];
        array[currentIndex] = array[randomIndex];
        array[randomIndex] = temporaryValue;
    }

    return array;
}

processCycle = function() {
    cycle++;

    if (cycle === 3) {
        stack();
        document.getElementById("game").style.display = "none";
        document.getElementById("output").style.display = "block";
        var output = document.getElementById('card-output');

        var position = getCardPosition(stackDeck[10]);

        output.style.backgroundPositionY = position[0] + 'px';
        output.style.backgroundPositionX = position[1] + 'px';
    }
}

printDeck = function() {
    var output = '';
    for (var line = 0; line < 7; line++) {
        for (var col = 0; col < 3; col++) {
            output += deck[col][line];
            output += col === 2 ? '\n' : ' | ';

            var cellId = line + ':' + col;

            var el = document.getElementById(cellId);

            var position = getCardPosition(deck[col][line]);

            el.style.backgroundPositionY = position[0] + 'px';
            el.style.backgroundPositionX = position[1] + 'px';
        }
    }
    console.log(output);
}

getCardPosition = function(card) {
    var position = [];

    var suit = card.substring(0, 1);
    var number = card.substring(1);

    switch (suit) {
        case 's' :
            position.push(0);
            break;
        case 'h' :
            position.push(-118);
            break;
        case 'c' :
            position.push(-238);
            break;
        case 'd' :
            position.push(-357);
            break;
        default :
        break;
    }

    position.push((101 * number) * -1);

    return position;
}

draw = function() {

}

main = function() {
    detectLanguage();

    populateCards();
    pickCards();

    sort();

    printDeck();

}
