
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
    term.clear()
    term.setCursorPos(1,1)
    print("Running Chatbox: Hold Ctrl + T to terminate\n") --Prints to let user know what script is Running
    print("--------------------------------\n")
    local SetCount = 0
    local largestSet = findLargestTable()
    if largestSet == -1 then error("Invalid table length") end
    while true do
        local event, playername, message = os.pullEvent("chat") --Grabs data from chat event
        print(playername .. ", " .. message .. "\n")
        for setCount = largestSet, 1, -1 do
            local str = string.lower(message)
            if string.find(str, greeting[setCount]) ~= nil then
                chtbx.sendMessage("Hello There " .. playername .. "!")
                --print("- Hello There " .. playername .. "!\n")
            elseif string.find(str, fines[setCount]) ~= nil then
                local fineAmount = math.random(500)
                chtbx.sendMessage("This is a \'" .. fines[setCount] .. "\' free zone! ".. fineAmount.."$ fine!")
                --print("- This is a \'" .. fines[setCount] .. "\' free zone! ".. fineAmount.."$ fine!\n")
            end
        end
    end
end
main()