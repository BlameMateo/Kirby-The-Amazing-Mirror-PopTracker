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

function canaccessrainbow()
    return  has("rainbow east hub") or has("rainbow south hub") or has("rainbow west hub") or has("rainbow north hub")
    or (has ("cabbage key") and (
        has ("cabbage west hub")
        or has ("cabbage east hub")
        )
    )
end

function canaccessmoonlight()
    return  has("moonlight key")
end

function canaccesscabbage()
    return  has("cabbage key") and (
    (has ("rainbow east hub") or has("rainbow south hub") or has("rainbow west hub") or has("rainbow north hub"))
    or has ("cabbage west hub")
    or has ("cabbage east hub")
    )
end

function canaccessmustard()
    return  has("mustard key") and canaccessrainbow()
end

function canaccesscarrot()
    return  has("carrot key") and (
        canaccessrainbow()
        or (has ("peppermint key") and has ("peppermint east hub"))
        or (canaccesscabbage() and has ("radish key") and has ("cc_lever") and has ("rr_lever"))
    )
end

function canaccessolive()
    return  has("olive key") and (
        canaccesscabbage()
        or (has ("moonlight key") and has ("mm_lever") and has ("oo_lever"))
    )
end

function canaccesspeppermint()
    return  has("peppermint key") and (
        canaccesscarrot()
        or has ("peppermint east hub")
    )
end

function canaccessradish()
    return  has("radish key") and (
        canaccesscabbage()
        or (canaccesscarrot() and has ("cc_lever") and has ("rr_lever"))
    )
end

function canaccesscandy()
    return  has("candy key") and (
        canaccessmoonlight()
        or canaccessmustard()
        or canaccesspeppermint()
        or has ("candy hub")
    )
end