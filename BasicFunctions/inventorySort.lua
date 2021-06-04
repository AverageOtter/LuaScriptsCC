--[[Author: Average_Otter]]--
--[[Purpose: Keep a Turtle's inventory sorted]]--

local INVENTORY_SIZE = 16

function inventorySort()
    for i = 1, INVENTORY_SIZE do
        local currentItem = turtle.getItemDetail(i)
        if currentItem ~= nil then
            turtle.select(i)
            for j = i, INVENTORY_SIZE do
                if turtle.compareTo(j) then
                    turtle.select(j)
                    turtle.transferTo(i)
                    turtle.select(i)
                end
            end
        end
    end
end