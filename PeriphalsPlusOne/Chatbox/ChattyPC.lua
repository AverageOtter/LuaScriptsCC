

function main()
    chtbx = peripheral.wrap("right")
    print("Running Chatbox Script : Press Ctrl + T (hold) to terminate")
    while true do
        local event, playername, message = os.pullEvent("chat")
        if playername == "Average_Otter" then
            sleep(5)
            chtbx.tell("Average_Otter", "Shush RudderButt")
        elseif message == "hello" then
            chtbx.say("Hello There!")
        end
    end
end
main()