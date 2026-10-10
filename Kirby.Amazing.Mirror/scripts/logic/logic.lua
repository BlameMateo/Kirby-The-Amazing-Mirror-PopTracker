-- put logic functions here using the Lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
-- don't be afraid to use custom logic functions. it will make many things a lot easier to maintain, for example by adding logging.
-- to see how this function gets called, check: locations/locations.json
-- example:

function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    if not amount then
        return count > 0
    else
        amount = tonumber(amount)
        return count >= amount
    end
end

function hasnot(item)
	local count2 = Tracker:ProviderCountForCode(item)
    if count2 > 0 then
		return false
	else return true
	end
end


function cancutrope()
    return has("cutter") or has("sword") or has("cupid") or has("smash") or has("master")
end

function canbreakblocks()
    return has("hammer") or has("stone") or has("throw") or has("burning") or has("missile") or has("ufo") or has("smash") or has("master")
end

function canlightfuses()
    return  has("master") or has("burning") or has("bomb") or has("laser") or has("ufo") or has("fire")
end

function canpoundpegs()
    return  has("hammer") or has("stone") or has("smash") or has("master")
end
