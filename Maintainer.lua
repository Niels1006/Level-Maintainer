local ae2 = require("src.AE2")
local cfg = require("config")

local items = cfg.items
local sleepInterval = cfg.sleep

while true do
    local itemsCrafting = ae2.checkIfCrafting()

    for k, v in pairs(items) do
        if itemsCrafting[k] ~= true then
            local answer = ae2.requestItem(k, v)
            if answer == true then
                print("[" .. os.date("%H:%M:%S") .. "] " .. "Requested " .. v .. "x " .. k)
            else
                print("[" .. os.date("%H:%M:%S") .. "] " .. "Failed to request " .. v .. "x " .. k)
            end
        end

    end
    os.sleep(sleepInterval)
end
