-- entry point for all lua code of the pack
-- more info on the lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
ENABLE_DEBUG_LOG = true
-- get current variant
local variant = Tracker.ActiveVariantUID
-- check variant info
IS_ITEMS_ONLY = variant:find("itemsonly")

print("-- Example Tracker --")
print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

-- Utility Script for helper functions etc.
ScriptHost:LoadScript("scripts/utils.lua")

-- Logic
ScriptHost:LoadScript("scripts/logic/logic.lua")

-- Custom Items
ScriptHost:LoadScript("scripts/custom_items/class.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlus.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlusWrapper.lua")

-- Items
Tracker:AddItems("items/items.jsonc")

if not IS_ITEMS_ONLY then -- <--- use variant info to optimize loading
    -- Maps
    Tracker:AddMaps("maps/maps.jsonc")
    -- Locations

    Tracker:AddLocations("locations/references.jsonc")
    Tracker:AddLocations("locations/rainbow.jsonc")
    Tracker:AddLocations("locations/moonlight.jsonc")
    Tracker:AddLocations("locations/cabbage.jsonc")
    Tracker:AddLocations("locations/mustard.jsonc")
    Tracker:AddLocations("locations/carrot.jsonc")
    Tracker:AddLocations("locations/olive.jsonc")
    Tracker:AddLocations("locations/peppermint.jsonc")
    Tracker:AddLocations("locations/radish.jsonc")
    Tracker:AddLocations("locations/candy.jsonc")
end

-- Layout
Tracker:AddLayouts("layouts/items.jsonc")
Tracker:AddLayouts("layouts/tracker.jsonc")
Tracker:AddLayouts("layouts/broadcast.jsonc")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end

local key = Tracker:FindObjectForCode("moonlight key")
if key then
    key:SetOverlay("Area 2")
    key:SetOverlayBackground("#808080")
    key:SetOverlayColor("#ffffff")
    key:SetOverlayFontSize(14)
    key:SetOverlayAlign("center")
end

local key = Tracker:FindObjectForCode("cabbage key")
if key then
    key:SetOverlay("Area 3")
    key:SetOverlayBackground("#808080")
    key:SetOverlayColor("#ffffff")
    key:SetOverlayFontSize(14)
    key:SetOverlayAlign("center")
end

local key = Tracker:FindObjectForCode("mustard key")
if key then
    key:SetOverlay("Area 4")
    key:SetOverlayBackground("#808080")
    key:SetOverlayColor("#ffffff")
    key:SetOverlayFontSize(14)
    key:SetOverlayAlign("center")
end

local key = Tracker:FindObjectForCode("carrot key")
if key then
    key:SetOverlay("Area 5")
    key:SetOverlayBackground("#808080")
    key:SetOverlayColor("#ffffff")
    key:SetOverlayFontSize(14)
    key:SetOverlayAlign("center")
end

local key = Tracker:FindObjectForCode("olive key")
if key then
    key:SetOverlay("Area 6")
    key:SetOverlayBackground("#808080")
    key:SetOverlayColor("#ffffff")
    key:SetOverlayFontSize(14)
    key:SetOverlayAlign("center")
end

local key = Tracker:FindObjectForCode("peppermint key")
if key then
    key:SetOverlay("Area 7")
    key:SetOverlayBackground("#808080")
    key:SetOverlayColor("#ffffff")
    key:SetOverlayFontSize(14)
    key:SetOverlayAlign("center")
end

local key = Tracker:FindObjectForCode("radish key")
if key then
    key:SetOverlay("Area 8")
    key:SetOverlayBackground("#808080")
    key:SetOverlayColor("#ffffff")
    key:SetOverlayFontSize(14)
    key:SetOverlayAlign("center")
end

local key = Tracker:FindObjectForCode("candy key")
if key then
    key:SetOverlay("Area 9")
    key:SetOverlayBackground("#808080")
    key:SetOverlayColor("#ffffff")
    key:SetOverlayFontSize(14)
    key:SetOverlayAlign("center")
end

local lever = Tracker:FindObjectForCode("mm_lever")
if lever then
    lever:SetOverlay("Moon")
    lever:SetOverlayBackground("#808080")
    lever:SetOverlayColor("#ffffff")
    lever:SetOverlayFontSize(14)
    lever:SetOverlayAlign("left")
end

local lever = Tracker:FindObjectForCode("oo_lever")
if lever then
    lever:SetOverlay("Olive")
    lever:SetOverlayBackground("#808080")
    lever:SetOverlayColor("#ffffff")
    lever:SetOverlayFontSize(14)
    lever:SetOverlayAlign("left")
end

local lever = Tracker:FindObjectForCode("cc_lever")
if lever then
    lever:SetOverlay("Carrot")
    lever:SetOverlayBackground("#808080")
    lever:SetOverlayColor("#ffffff")
    lever:SetOverlayFontSize(14)
    lever:SetOverlayAlign("left")
end

local lever = Tracker:FindObjectForCode("rr_lever")
if lever then
    lever:SetOverlay("Radish")
    lever:SetOverlayBackground("#808080")
    lever:SetOverlayColor("#ffffff")
    lever:SetOverlayFontSize(14)
    lever:SetOverlayAlign("left")
end