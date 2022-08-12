if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

local deck = require("deck")
local cards

function love.load()
    math.randomseed(os.time())
    -- isDebug = false
    deck.populate()

    cards = deck.pick_cards()
    deck.sort(cards)
end

function love.update(dt)
end

function love.draw()
    if isDebug then
        love.graphics.print("Current FPS: "..tostring(love.timer.getFPS()), 10, 10)
        love.graphics.print(string.format("Average frame time: %.3f ms", 1000 * love.timer.getAverageDelta()), 10, 25)
    end

    -- love.graphics.print('card trick', 5, 5)
    -- for i = 1, #cards, 1 do
    --     local card = cards[i]
    --     love.graphics.print(card.num..card.suit, 10, 20 + (10 * i))
    -- end
    deck.draw()
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

   deck.select_column(key)
end
