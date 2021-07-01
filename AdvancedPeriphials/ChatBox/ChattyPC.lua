function main()
    chtbx = peripheral.find("chatBox")
    if chtbx == nil then error("Missing ChatBox") end
    print("Running Chatbox Script : Press Ctrl + T (hold) to terminate")
    while true do
        local event, playername, message = os.pullEvent("chat")
        --Messages
        if message == "hello" then
            chtbx.sendMessage("Hello There " .. playername .. "!")
        elseif message == "uwu" or message == "owo" then
            chtbx.sendMessage("This is a \'" .. message .. "\' free zone! 300$ fine!")
        elseif message == "awoo" then
            chtbx.sendMessage("'" .. message .. "s are not permitted, 500$ fine!")
        --Players
        elseif playername == "Average_Otter" then
            sleep(4)
            chtbx.sendMessageToPlayer("Shush RudderButt.", playername)
        elseif playername == "KazyHachi" then
            sleep(4)
            chtbx.sendMessageToPlayer("You're Cute owoowowowowo!", playername)
        end

    end
end
main()