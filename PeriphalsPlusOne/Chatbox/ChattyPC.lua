---@diagnostic disable: undefined-global, undefined-field

function main()
    while true do
        local eventtype = os.pullEvent()
        if eventtype then
            local event, playername, message = os.pullEvent("chat")
            if playername == "Average_Otter" then
                tell("Average_Otter", "Shush RudderButt")
            end
        end
    end
end
main()