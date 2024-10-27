local component = require("component")
local ME = component.me_interface
local util = require("src.Utility") 

local AE2 = {}
local ongoingCrafts = {}

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
                return table.unpack({false,
                                     "The amount of " .. itemInSystem[1]["label"] ..
                    " exceeds threshold! Aborting request."})
            end
        end
        if item.label == name then
            local craft = craftables[1].request(count)

            -- for k, v in pairs(craft) do
            --     print(k, v)
            -- end

            local _, msg = craft.isCanceled()
            -- if msg ~= nil then
            --     util.logInfo(itemLabel .. msg)
            -- end

            if (_ == true) or (msg ~= nil) then
                return table.unpack({false, "Failed to request " .. name .. " x " .. count .. " - " .. msg})
            else

                table.insert(ongoingCrafts, {
                    ["itemLabel"] = item.label,
                    ["craft"] = craft
                })
                return table.unpack({true, "Requested " .. name .. " x " .. count})
            end

        end
    end
    return table.unpack({false, name .. " is not craftable!"})
end

function AE2.checkIfCrafting()
    local cpus = ME.getCpus()
    local items = {}
    for k, v in pairs(ongoingCrafts) do
        -- for k2, v2 in pairs(v.craft) do
        --     print(k2, v2)
        -- end
        local _, msg = v.craft.isCanceled()

            
        if ((v.craft.isDone() or _) == false) and msg == nil then
            items[v.itemLabel] = true
        else
            items[v.itemLabel] = false
            ongoingCrafts[k] = nil
        end

        -- print(v.craft.isDone())
        -- print(v.craft.isCanceled())
        -- print((v.craft.isDone() or v.craft.isCanceled()) == false)
        -- print("----------------------")
    end

    return items
end

return AE2
