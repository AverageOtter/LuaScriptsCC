function main()
    chtbx = peripheral.find("chatbox")
    if chtbx == nil then error("Missing ChatBox") end
    print("Running Chatbox Script : Press Ctrl + T (hold) to terminate")
    while true do
        local event, playername, message = os.pullEvent("chat")
        --Players
        if playername == "Average_Otter" then
            sleep(4)
            chtbx.sendMessageToPlayer("Shush RudderButt.", playername)
        elseif playername == "KazyHachi" then
            sleep(4)
            chtbx.sendMessageToPlayer("You're Cute owoowowowowo!", playername)
        --Messages
        elseif message == "hello" then
            chtbx.sendMessage("Hello There " + playername + "!")
        elseif message == "uwu" or message == "owo" then
            chtbx.sendMessage("This is a '" + message + "' free zone! 300$ fine!")
        end

    end
end
main()