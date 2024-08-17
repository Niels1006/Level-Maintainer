local ae2 = require("src.AE2")
local cfg = require("config")
 
local items = cfg.items
local sleepInterval = cfg.sleep
 
while true do
    local itemsCrafting = ae2.checkIfCrafting()
 
    for item, config in pairs(items) do
        if itemsCrafting[k] ~= true then
            local answer = ae2.requestItem(item, config[1], config[2])
            if answer == true then
                print("[" .. os.date("%H:%M:%S") .. "] " .. "Requested " .. item .. "x " .. config[2])
            else
                print("[" .. os.date("%H:%M:%S") .. "] " .. "Failed to request " .. item .. "x " .. config[2])
            end
        end
 
    end
    os.sleep(sleepInterval)
end
