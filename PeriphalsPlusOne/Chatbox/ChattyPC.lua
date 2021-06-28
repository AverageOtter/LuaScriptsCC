

function main()
    chtbx = peripheral.wrap("right")
    while true do
        local event, playername, message = os.pullEvent("chat")
        if playername == "Average_Otter" then
            chtbx.tell("Average_Otter", "Shush RudderButt")
        end
    end
end
main()