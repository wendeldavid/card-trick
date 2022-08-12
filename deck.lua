local suits = require("suits")

local allCards = {}

local columns
local cycle = 1
local shuffle = function()
    for i, c in ipairs(allCards) do
        local j = math.random(#allCards)
        local tempCard = allCards[i]
        allCards[i] = allCards[j]
        allCards[j] = tempCard
    end
end

local populate = function()
    for i = 1, 4, 1 do
        for j = 1, 13, 1 do
            if i == 1 then
                table.insert(allCards, { num = j, suit = suits.spades })
            elseif i == 2 then
                table.insert(allCards, { num = j, suit = suits.hearts })
            elseif i == 3 then
                table.insert(allCards, { num = j, suit = suits.clubs })
            elseif i == 4 then
                table.insert(allCards, { num = j, suit = suits.diamond })
            end
        end
    end
end

local pick_cards = function()
    shuffle()

    local cardsToPlace = {}
    for i = 1, 21, 1 do
        table.insert(cardsToPlace, allCards[i])
    end
    return cardsToPlace
end

local sort = function(cards)
    columns = {
        {},{},{}
    }
    for i= 1, #cards, 1 do
        for j = 1, 3, 1 do
            table.insert(columns[j], cards[1])
            table.remove(cards, 1)
        end
    end
end

local join = function(t1, t2)
    local new_table = {}
    for k, v in ipairs(t1) do
        table.insert(new_table, v)
    end
    for k, v in ipairs(t2) do
        table.insert(new_table, v)
    end
    return new_table
end

local restack = function(column)
    local new_cards = {}
    if column == 1 then
        new_cards = join(columns[2], columns[1])
        new_cards = join(new_cards, columns[3])
    elseif column == 2 then
        new_cards = join(columns[1], columns[2])
        new_cards = join(new_cards, columns[3])
    elseif column == 3 then
        new_cards = join(columns[1], columns[3])
        new_cards = join(new_cards, columns[2])
    end

    sort(new_cards)
end

local draw = function()
    if cycle <= 3 then
        love.graphics.print("col1  |  col2  |  col3", 40, 10)
        for i = 1, 7, 1 do
            for j = 1, 3, 1 do
                local card = columns[j][i].num..columns[j][i].suit
                love.graphics.print(card, 10 + (j * 40), 10 + (i * 40))
            end
        end
    else
        local cards = join(columns[1], columns[2])
        cards = join(cards, columns[3])

        local card = cards[11]

        love.graphics.print("a carta escolhida é: "..card.num..card.suit, 40, 10)
    end
end

local select_column = function(col)
    if cycle <= 3 then
        if col == '1' then
            restack(1)
        elseif col == '2' then
            restack(2)
        elseif col == '3' then
            restack(3)
        end

        cycle = cycle + 1
    end
end

local deck = {
    populate = populate,
    sort = sort,
    pick_cards = pick_cards,
    draw = draw,
    select_column = select_column,

    allCards = allCards,
}

return deck