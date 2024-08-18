local cfg = {}

-- EXAMPLE --

-- [item_name] = {threshold, batch_size} -- keep in mind that no threshold has a better performance!
-- ["Osmium Dust"] = {nil, 64} -- without threshold, batch_size=64
-- ["drop of Molten SpaceTime"] = {1000000, 1} -- with threshold

cfg["items"] = {
    ["drop of Molten SpaceTime"] = {nil, 1}
    ["drop of Molten White Dwarf Matter"] = {nil, 1}
}

cfg["sleep"] = 10

return cfg
