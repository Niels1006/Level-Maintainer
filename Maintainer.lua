package.loaded["src.AE2"] = nil
package.loaded["config"] = nil
package.loaded["src.Utility"] = nil

local ae2 = require("src.AE2")
local cfg = require("config")
local util = require("src.Utility") 

local items = cfg.items
local sleepInterval = cfg.sleep
 
while true do
    local itemsCrafting = ae2.checkIfCrafting()
 
    for item, config in pairs(items) do
        if itemsCrafting[item] ~= true then
            local success, answer = ae2.requestItem(item, config[1], config[2])
            if success == true then
                logInfo(answer)
            end
        end
 
    end
    os.sleep(sleepInterval)
end
