
local greeting = {"hello", "hey", "o/", "ello", "howdy", "hello there"}
local fines = {"uwu", "owo", "awoo", "o3o", "ono"}


function main()
    chtbx = peripheral.find("chatBox") --Wraps connected chatbox
    if chtbx == nil then error("Missing ChatBox") end --Errors if chatbox isnt connected.
    file = io.open("ChatboxOutput.txt", "a+" )
    io.output(file)
    term.clear()
    term.setCursorPos(1,1)
    print("Running Chatbox: Hold Ctrl + T to terminate") --Prints to let user know what script is Running
    print("----------------------------------")
    while true do
        local event, playername, message = os.pullEvent("chat") --Grabs data from chat event
        local str = string.lower(message)
        for setCount = #greeting, 1, -1 do
            if string.find(str, greeting[setCount]) ~= nil then
                chtbx.sendMessage("Hello There " .. playername .. "!")
                io.write(os.date() .. " - Hello There " .. playername .. "! : " .. playername .. "\n")
                sleep(2)
            end
        end
        for setCount = #fines, 1, -1 do
            if string.find(str, fines[setCount]) ~= nil then
                local fineAmount = math.random(100, 500)
                chtbx.sendMessage("This is a \'" .. fines[setCount] .. "\' free zone! ".. fineAmount.."$ fine!")
                io.write(os.date() .. " - This is a \'" .. fines[setCount] .. "\' free zone! ".. fineAmount.."$ fine! : " .. playername .."\n")
                sleep(2)
            end
        end
    end
end
main()