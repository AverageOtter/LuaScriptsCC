

function main()
    chtbx = peripheral.wrap("right")
    print("Running Chatbox Script : Press Ctrl + T (hold) to terminate")
    while true do
        local event, playername, message = os.pullEvent("chat")
        --Players
        if playername == "Average_Otter" then
            sleep(5)
            chtbx.tell("Average_Otter", "Shush RudderButt")
        elseif playername == "KazyHachi" then
            chtbx.tell(playername, "You're Cute owoowowowowo!")
        --Messages
        elseif message == "hello" then
            chtbx.say("Hello There " + playername + "!")
        elseif message == "uwu" or message == "owo" then
            chtbx.say("This is a '" + message + "' free zone! 300$ fine!")
        end

    end
end
main()