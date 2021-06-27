--[[Author: Average_Otter]]--
--[[Purpose: To dig a 14x14 hole to y level 10]]--#region

function DigLine()
    for i = 1, 14, 1 do
        turtle.dig()
        turtle.moveFoward()
    end
end

--Recursive loop
local depth = 0
local TurnSignal = 0   --0 is a Right Turn, Left is a 1... Used to make zig zag pattern
function DigLayer(TurnSignal)
    for i = 1, 14, 1 do
        DigLine()
        if TurnSignal == 0 then
            turtle.turnRight()
            turtle.dig()
            turtle.moveFoward()
            turtle.turnRight()
            TurnSignal = 1
        else
            turtle.turnLeft()
            turtle.dig()
            turtle.moveFoward()
            turtle.turnLeft()
        end
        turtle.turnRight()
        DigLine()
        turtle.turnRight()
        turtle.digDown()
        turtle.down()
        depth = depth + 1
    end
end

local Starting_Y
function DIGLOOP(Starting_Y)
    if Starting_Y then
        turtle.dig()
        turtle.forward()
        turtle.digDown()
        turtle.down()
        for i = 1, Starting_Y - 10, 1 do
            DigLayer(0)
        end
        
    else
        print("Incorrect Y-level")
    end
end