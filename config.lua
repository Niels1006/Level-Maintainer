local cfg = {}

-- EXAMPLE --

-- [item_name] = {batch_size, threshold (if no threshold is present it maintains to inf)} -- keep in mind that no threshold has a better performance!
-- ["Osmium Dust"] = {64} -- without threshold, batch_size=64
-- ["drop of Molten SpaceTime"] = {1, 1000000} -- with threshold

cfg["items"] = {
    ["drop of Molten SpaceTime"] = {1}
    ["drop of Molten White Dwarf Matter"] = {1}
}

cfg["sleep"] = 10

return cfg
