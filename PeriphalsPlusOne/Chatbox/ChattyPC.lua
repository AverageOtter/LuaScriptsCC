---@diagnostic disable: undefined-global, undefined-field

local chatbox = periphial.wrap("right")
while true do
    local eventtype = os.pullEvent()
    if eventtype then
        local event, playername, message = os.pullEvent("chat")
        if playername == "Average_Otter" then
            chatbox.tell("Average_Otter", "Shush RudderButt")
        end
    end
end
--Wow
