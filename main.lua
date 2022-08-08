if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

local suits = require('suits')

function love.load()
    -- isDebug = false
end

function love.update(dt)
end

function love.draw()
    if isDebug then
        love.graphics.print("Current FPS: "..tostring(love.timer.getFPS()), 10, 10)
        love.graphics.print(string.format("Average frame time: %.3f ms", 1000 * love.timer.getAverageDelta()), 10, 25)
    end

    love.graphics.print(suits.spades, 10, 50)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
   end
end
