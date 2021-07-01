term.clear()
term.setCursorPos(1,1)
io.write("A revised version of Gambit's V1 Code w/o bore")
term.clear()
term.setCursorPos(1,1)
io.write("Rows: ")
rows = io.read()
io.write("Columns: ")
columns = io.read()
iniY = 2
term.clear()
term.setCursorPos(1,1)
io.write("Current 'y' level: ")
iniY = io.read()
term.clear()
term.setCursorPos(1,1)
io.write("Toss garbage blocks? yes/no ")
tossGarbage = io.read()
term.clear()
term.setCursorPos(1,1)
io.write("Is the selected area, (" .. rows .. "x" .. columns .. "), already quarried? yes/no")
continuequarry = "no"
continuequarry = io.read()
term.clear()
term.setCursorPos(1,1)

--Add the TAGS of blocks you do not want. Find the tags of items by pressing F3 + h and looking at items in inventory
trashTypes = {"forge:stone", "forge:dirt", "minecraft:stone", "minecraft:dirt"}
--Add fuel you would like the turtle to use. Only solid fuel please (I.e)
fuelTypes = {"minecraft:coal", "minecraft:charcoal", "minecraft:coals", "forge:gems/coal"}

posX = 0
posY = 0
posZ = 0

rotation = 0

fullSlots = 0

function info()
    term.clear()
    term.setCursorPos(1,1)
    print("---------------------------------------")
    print("Mining size: " .. rows .. " by " .. columns)
    print("Total distance: " .. posX + posY + posZ)
    print("X: " .. posX)
    print("Y: " .. posY)
    print("Z: " .. posZ)
    print("Orientation: " .. rotation)
    if tossGarbage == "yes" then
        print("Toss garbage: Yes")
    else
        print("Toss garbage: No")
    end
    print("")
    print("Fuel level: " .. turtle.getFuelLevel())
end

function rotate()
    if rotation == 0 then
        turtle.turnLeft()
    elseif rotation == 1 then
        turtle.turnLeft()
        turtle.turnLeft()
    elseif rotation == 2 then
        turtle.turnRight()
    end
end

function recover()
    rotate()
    local step = 0
    for step = posY - 1, 0, -1 do
        turtle.up()
    end
    for step = posX - 1, 0, -1 do
        turtle.forward()
    end
    turtle.turnLeft()
    for step = posZ - 1, 0, -1 do
        turtle.forward()
    end
end

function resume()
    turtle.turnLeft()
    turtle.turnLeft()
    local step = 0
    for step = 0, posZ - 1, 1 do
        turtle.forward()
    end
    turtle.turnRight()
    for step = 0, posX - 1, 1 do
        turtle.forward()
    end
    for step = 0, posY - 1, 1 do
        turtle.down()
    end
    if rotation == 0 then
        turtle.turnLeft()
    elseif rotation == 2 then
        turtle.turnRight()
    elseif rotation == 3 then
        turtle.turnRight()
        turtle.turnRight()
    end
end

function checkFuel()
    if turtle.getFuelLevel() <= 300 then
        local search = 0
        for search = 16, 1, -1 do
            local item = turtle.getItemDetail(search, true)
            turtle.select(search)
            if item then
                local typecount = 0
                for typeCount = #fuelTypes, 1, -1 do
                    if item.tags[fuelTypes[typeCount]] then 
                        turtle.refuel(2)
                    end
                end
            end
        end
    elseif turtle.getFuelLevel() <= posX + posY + posZ + 1 then
        refill = 1
        empty()
        refill = 0
    end
end

function empty()
    recover()
    local search = 0
    for search = 16, 1, -1 do
        turtle.select(search)
        turtle.drop()
    end
    if refill == 1 then
        turtle.turnRight()
        while turtle.getFuelLevel() <= posX + posY + posZ + 1 do
            if turtle.suck() == true then
                local search = 0
                for search = 16, 1, -1 do
                    local item = turtle.getItemDetail(search, true)
                    turtle.select(search)
                    if item then
                        local typecount = 0
                        for typeCount = #fuelTypes, 1, -1 do
                            if item.tags[fuelTypes[typeCount]] then 
                                turtle.refuel(2)
                            end
                        end
                    end
                end
            elseif turtle.suck() == false then
                turtle.select(1)
                turtle.refuel()
                term.clear()
                term.setCursorPos(1,1)
                io.write("Please add more fuel to slot '1' or fuel chest.")
            end
        end
        turtle.turnLeft()
        resume()
    end
    if done ~= 1 then
        resume()
    end
end

function checkFull()
    fullSlots = 0
    local search = 0
    for search = 16, 1, -1 do
        local item = turtle.getItemDetail(search, true)
        turtle.select(search)
        if item then
            local typecount = 0
            for typeCount = #trashTypes, 1, -1 do
                if item.tags[trashTypes[typeCount]] then 
                    turtle.drop() 
            turtle.drop()
                    turtle.drop() 
                end
            end
        end
        if turtle.getItemCount() > 0 then
            fullSlots = fullSlots + 1
        end
    end
    if fullSlots == 16 then
        empty()
    end
end

function nextRow()
    if turn == 0 then
        turtle.turnRight()
        rotation = 1
        digStraight()
        turtle.turnRight()
        rotation = 2
        turn = 1
    elseif turn == 1 then
        turtle.turnLeft()
        rotation = 1
        digStraight()
        turtle.turnLeft()
        rotation = 0
        turn = 0 
    elseif turn == 2 then
        turtle.turnRight()
        rotation = 3
        digStraight()
        turtle.turnRight()
        rotation = 0
        turn = 3
    elseif turn == 3 then
        turtle.turnLeft()
        rotation = 3
        digStraight()
        turtle.turnLeft()
        rotation = 2
        turn = 2
    end
end

function digDown()
    checkFuel()
    local step = 0
    for step = 2, 0, -1 do
        turtle.digDown()
        if turtle.down() == true then
            posY = posY + 1
        end
        info()
    end
end

function digStraight()
    checkFuel()
    turtle.digDown()
    turtle.dig()
    turtle.dig()
    turtle.forward()
    if rotation == 0 then
        posZ = posZ + 1
    elseif rotation == 1 then
        posX = posX + 1
    elseif rotation == 2 then
        posZ = posZ - 1
    elseif rotation == 3 then
        posX = posX - 1
    end
    turtle.digUp()
    info()
end

function quarry()
    turn = 0
    done = 0
    iniY = tonumber (iniY)
    if continuequarry == "yes" then
        while turtle.down() do
            posY = posY + 1
        end
    end
    checkFuel()
    turtle.digUp()
    turtle.up()
    posY = posY - 1
    while posY < iniY - 2 do
        digDown()
        for c = columns, 1, -1 do
            for r = rows, 2, -1 do
                digStraight()
            end
            checkFull()
            if c == 1 then
                turtle.turnRight()
                turtle.turnRight()
                if rotation == 0 then
                    rotation = 2
                elseif rotation == 2 then
                    rotation = 0
                end
                if turn == 0 then
                    turn = 2
                elseif turn == 1 then
                    turn = 3
                elseif turn == 2 then
                    turn = 0
                elseif turn == 3 then
                    turn = 1
                end
            elseif c > 1 then
                nextRow()
            end
        end
    end
    turtle.digDown()
    done = 1
    empty()
    term.clear()
    term.setCursorPos(1,1)
    print("Thank you for using Average_Otter's revised Gambit quarry program!")
    print("---------------------------------------")
end

quarry()