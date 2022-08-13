if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

local deck = require("deck")


local cards

function love.load()
    math.randomseed(os.time())
    isDebug = false

    wf = require('libs/windfield/windfield')

    sti = require('libs/Simple-Tiled-Implementation/sti')

    map = sti("assets/cards-deck.lua")

    world = wf.newWorld(0, 0, false)

    world:setQueryDebugDrawing(true)

    world:addCollisionClass("c1")
    world:addCollisionClass("c2")
    world:addCollisionClass("c3")

	-- Prepare collision objects
	-- map:box2d_init(world)

    deck.populate()

    cards = deck.pick_cards()
    deck.sort(cards)

    for k,v in ipairs(map.objects) do
        local card = v
        local cardObject = world:newRectangleCollider(card.x, card.y, card.width, card.height, { collision_class = card.class })
        -- cardObject:setType('static')
    end
end

function love.update(dt)
    world:setQueryDebugDrawing(isDebug)
    world:update(dt)
end

function love.draw()
    world:draw()
    if isDebug then
        love.graphics.print("Current FPS: "..tostring(love.timer.getFPS()), 10, 10)
        love.graphics.print(string.format("Average frame time: %.3f ms", 1000 * love.timer.getAverageDelta()), 10, 25)

        -- Draw the map and all objects within
        -- love.graphics.setColor(1, 1, 1)
        -- map:draw()

        love.graphics.push('all')

            love.graphics.setColor(1, 0, 0)
            map:draw()

        love.graphics.pop()
    end

    deck.draw()
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
        return
    end

    if key == 'f2' then
        isDebug = not isDebug
        return
    end

   deck.select_column(key)
end

function love.mousepressed(x, y, button)
    local colliders = world:queryLine(x, 0, x, 1000, { 'c1', 'c2', 'c3' } )
    if next(colliders) then
        local collisionClass = colliders[1].collision_class

        if collisionClass == 'c1' then
            deck.select_column(1)
        elseif collisionClass == 'c2' then
            deck.select_column(2)
        elseif collisionClass == 'c3' then
            deck.select_column(3)
        end
    end
end