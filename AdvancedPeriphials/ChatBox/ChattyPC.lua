
local greeting = {"hello", "hey", "o/", "ello", "howdy", "hello there"}
local fines = {"uwu", "owo", "awoo", "o3o", "ono"}

function findLargestTable()
    local max = -1
    if #greeting > #fines then 
        max = #greeting
    else
        max = #fines
    end
    return max
end

function main()
    chtbx = peripheral.find("chatBox") --Wraps connected chatbox
    if chtbx == nil then error("Missing ChatBox") end --Errors if chatbox isnt connected.
    io.flush()
    io.write("Running Chatbox Script : Press Ctrl + T (hold) to terminate") --Prints to let user know what script is Running
    io.write("----------------------------------------------------")
    local SetCount = 0
    local largestSet = findLargestTable()
    if largestSet == -1 then error("Invalid table length") end
    while true do
        local event, playername, message = os.pullEvent("chat") --Grabs data from chat event
        for setCount = largestSet, 1, -1 do
            local str = string.lower(message)
            if str:find(greeting[setCount]) then
                chtbx.sendMessage("Hello There " .. playername .. "!")
                io.write("- Hello There " .. playername .. "!")
            elseif str:find(fines[setCount]) then
                local fineAmount = math.random(500)
                chtbx.sendMessage("This is a \'" .. fines[setCount] .. "\' free zone! ".. fineAmount.."$ fine!")
                io.write("- This is a \'" .. fines[setCount] .. "\' free zone! ".. fineAmount.."$ fine!")
            end
        end
    end
end
main()