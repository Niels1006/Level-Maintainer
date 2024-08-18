local component = require("component")
local ME = component.me_interface

local AE2 = {}

function AE2.requestItem(name, threshold, count)
    craftables = ME.getCraftables({
        ["label"] = name
    })

    if #craftables >= 1 then
        item = craftables[1].getItemStack()
        if threshold ~= nil then
            itemInSystem = ME.getItemsInNetwork({
                ["label"] = name        
            })
            if (#itemInSystem > 0 and itemInSystem[1]["size"] > threshold) then 
                return table.unpack({false, "The amount of " .. itemInSystem[1]["label"] .. " exceeds threshold! Aborting request."})
            end
        end
        if item.label == name then
            local craft = craftables[1].request(count)

            while craft.isComputing() == true do
                os.sleep(1)
            end
            if craft.hasFailed() then
                return table.unpack({false, "Failed to request " .. name .. " x " .. count})
            else
                return table.unpack({true, "Requested " .. name .. " x " .. count})
            end

        end
    end
    return table.unpack({false, name .. " is not craftable!"})
end

function  AE2.checkIfCrafting()
    local cpus = ME.getCpus()
    local items = {}
    for k, v in pairs(cpus) do
        local finaloutput = v.cpu.finalOutput()
        if finaloutput ~= nil then
            items[finaloutput.label] = true
        end
    end

    return items
end

return AE2
