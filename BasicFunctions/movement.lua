--[[Author: Average_Otter]]--
--[[Purpose: To Create Basic Movement Function]]--
-- Forward
function moveFoward(times)
    if times then
        for i = 1, times do
            while not turtle.forward() do
            --Could be another turtle should turtle.inspect
            --[[
                local has_block, data = turtle.inspect()
                if has_block then
                    if data["name"] then
                        
                    end
                
                end
            ]]--
                turtle.dig()
            end
        end
    else
        turtle.forward()
    end
end

-- Turn Left
function turnLeft(times)
    if times then
        for i = 1, times do
            turtle.turnLeft()
        end
    else
        turtle.turnLeft()
    end
end

-- Turn Right
function turnRight(times)
    if times then
        for i = 1, times do
            turtle.turnRight()
        end
    else
        turtle.turnRight()
    end
end


--Testing / Main
moveFoward()
turnLeft()
turnRight(2)
turnLeft(3)
moveFoward(3)