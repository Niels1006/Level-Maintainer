local cfg = {}

-- EXAMPLE --

-- [item_name] = {threshold, batch_size} -- keep in mind that no threshold has a better performance!
-- ["Osmium Dust"] = {nil, 64} -- without threshold, batch_size=64
-- ["drop of Molten SpaceTime"] = {1000000, 1} -- with threshold

cfg["items"] = {
    ["Platinum Dust"] = {nil, 16},
    ["Palladium Dust"] = {nil, 16},

    ["Ruthenium Dust"] = {nil, 16},
    ["Rhodium Dust"] = {nil, 16},

    ["Iridium Dust"] = {nil, 16},
    ["Osmium Dust"] = {nil, 16},

    ["Gold Dust"] = {nil, 16},
    ["Silicon Dust"] = {nil, 16},

    ["Copper Dust"] = {nil, 16},
    ["Nickel Dust"] = {nil, 16},

    ["Drop of Ammonia"] = {nil, 16000},

   
    
}

cfg["sleep"] = 2

return cfg
