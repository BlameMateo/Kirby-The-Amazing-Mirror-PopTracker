-- this is an example/default implementation for AP autotracking
-- it will use the mappings defined in item_mapping.lua and location_mapping.lua to track items and locations via their ids
-- it will also keep track of the current index of on_item messages in CUR_INDEX
-- addition it will keep track of what items are local items and which one are remote using the globals LOCAL_ITEMS and GLOBAL_ITEMS
-- this is useful since remote items will not reset but local items might
-- if you run into issues when touching A LOT of items/locations here, see the comment about Tracker.AllowDeferredLogicUpdate in autotracking.lua
ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/tab_mapping.lua")
-- used for hint tracking to quickly map hint status to a value from the Highlight enum
HINT_STATUS_MAPPING = {}
if Highlight then
	HINT_STATUS_MAPPING = {
		[20] = Highlight.Avoid,
		[40] = Highlight.None,
		[10] = Highlight.NoPriority,
		[0] = Highlight.Unspecified,
		[30] = Highlight.Priority,
	}
end

CUR_INDEX = -1
LOCAL_ITEMS = {}
GLOBAL_ITEMS = {}

-- gets the data storage key for hints for the current player
-- returns nil when not connected to AP
function getHintDataStorageKey()
	if AutoTracker:GetConnectionState("AP") ~= 3 or Archipelago.TeamNumber == nil or Archipelago.TeamNumber == -1 or Archipelago.PlayerNumber == nil or Archipelago.PlayerNumber == -1 then
		if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
			print("Tried to call getHintDataStorageKey while not connect to AP server")
		end
		return nil
	end
	return string.format("_read_hints_%s_%s", Archipelago.TeamNumber, Archipelago.PlayerNumber)
end

-- resets an item to its initial state
function resetItem(item_code, item_type)
	local obj = Tracker:FindObjectForCode(item_code)
	if obj then
		item_type = item_type or obj.Type
		if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
			print(string.format("resetItem: resetting item %s of type %s", item_code, item_type))
		end
		if item_type == "toggle" or item_type == "toggle_badged" then
			obj.Active = false
		elseif item_type == "progressive" or item_type == "progressive_toggle" then
			obj.CurrentStage = 0
			obj.Active = false
		elseif item_type == "consumable" then
			obj.AcquiredCount = 0
		elseif item_type == "custom" then
			-- your code for your custom lua items goes here
		elseif item_type == "static" and AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
			print(string.format("resetItem: tried to reset static item %s", item_code))
		elseif item_type == "composite_toggle" and AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
			print(string.format(
				"resetItem: tried to reset composite_toggle item %s but composite_toggle cannot be accessed via lua." ..
				"Please use the respective left/right toggle item codes instead.", item_code))
		elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
			print(string.format("resetItem: unknown item type %s for code %s", item_type, item_code))
		end
	elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("resetItem: could not find item object for code %s", item_code))
	end
end

-- advances the state of an item
function incrementItem(item_code, item_type, multiplier)
	local obj = Tracker:FindObjectForCode(item_code)
	if obj then
		item_type = item_type or obj.Type
		if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
			print(string.format("incrementItem: code: %s, type %s", item_code, item_type))
		end
		if item_type == "toggle" or item_type == "toggle_badged" then
			obj.Active = true
		elseif item_type == "progressive" or item_type == "progressive_toggle" then
			if obj.Active then
				obj.CurrentStage = obj.CurrentStage + 1
			else
				obj.Active = true
			end
		elseif item_type == "consumable" then
			obj.AcquiredCount = obj.AcquiredCount + obj.Increment * multiplier
		elseif item_type == "custom" then
			-- your code for your custom lua items goes here
		elseif item_type == "static" and AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
			print(string.format("incrementItem: tried to increment static item %s", item_code))
		elseif item_type == "composite_toggle" and AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
			print(string.format(
				"incrementItem: tried to increment composite_toggle item %s but composite_toggle cannot be access via lua." ..
				"Please use the respective left/right toggle item codes instead.", item_code))
		elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
			print(string.format("incrementItem: unknown item type %s for code %s", item_type, item_code))
		end
	elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("incrementItem: could not find object for code %s", item_code))
	end
end

-- apply everything needed from slot_data, called from onClear
function apply_slot_data(slot_data)
	-- put any code here that slot_data should affect (toggling setting items for example)
end

-- called right after an AP slot is connected
function onClear(slot_data)
	-- use bulk update to pause logic updates until we are done resetting all items/locations
	Tracker.BulkUpdate = true
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("called onClear, slot_data:\n%s", dump_table(slot_data)))
	end
	CUR_INDEX = -1 
	SLOT_DATA = slot_data
	-- reset locations
	for _, mapping_entry in pairs(LOCATION_MAPPING) do
		for _, location_table in ipairs(mapping_entry) do
			if location_table then
				local location_code = location_table[1]
				if location_code then
					if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
						print(string.format("onClear: clearing location %s", location_code))
					end
					if location_code:sub(1, 1) == "@" then
						local obj = Tracker:FindObjectForCode(location_code)
						if obj then
							--obj.AvailableChestCount = obj.ChestCount
							if obj.Highlight then
								obj.Highlight = Highlight.None
							end
						elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
							print(string.format("onClear: could not find location object for code %s", location_code))
						end
					else
						-- reset hosted item
						local item_type = location_table[2]
						resetItem(location_code, item_type)
					end
				elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
					print(string.format("onClear: skipping location_table with no location_code"))
				end
			elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
				print(string.format("onClear: skipping empty location_table"))
			end
		end
	end
	-- reset items
	for _, mapping_entry in pairs(ITEM_MAPPING) do
		for _, item_table in ipairs(mapping_entry) do
			if item_table then
				local item_code = item_table[1]
				local item_type = item_table[2]
				if item_code then
					resetItem(item_code, item_type)
				elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
					print(string.format("onClear: skipping item_table with no item_code"))
				end
			elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
				print(string.format("onClear: skipping empty item_table"))
			end
		end
	end
	
	
	PLAYER_ID = Archipelago.PlayerNumber or -1
	TEAM_NUMBER = Archipelago.TeamNumber or 0

	DATA_STORAGE_ID = "KirbyAM"..TEAM_NUMBER.."_"..PLAYER_ID

	

	if Archipelago.PlayerNumber>-1 then
		print("Current slot data is",TEAM_NUMBER,PLAYER_ID)
		EVENT_ID="KirbyAM"..TEAM_NUMBER.."_"..PLAYER_ID
		print(string.format("SET NOTIFY %s",EVENT_ID))
		Archipelago:SetNotify({EVENT_ID})
		Archipelago:Get({EVENT_ID})
	end

	Tracker:FindObjectForCode("tab_switch").CurrentStage = 0
	Tracker:FindObjectForCode("room_switch").CurrentStage = 1

	Tracker:FindObjectForCode("ground_items").CurrentStage = 2
	Tracker:FindObjectForCode("roomsanity").CurrentStage = 2
	Tracker:FindObjectForCode("minny").CurrentStage = 2
	Tracker:FindObjectForCode("minibosses").CurrentStage = 2
	Tracker:FindObjectForCode("boss_spawn").CurrentStage = 2
	Tracker:FindObjectForCode("passive").CurrentStage = 2





   -- if slot_data["shards"] then
   --     Tracker:FindObjectForCode("mirror_n").AcquiredCount = slot_data["shards"]
   -- end
	
    if slot_data["start_with_all_maps"] then
		Tracker:FindObjectForCode("world map").CurrentStage = 1
		Tracker:FindObjectForCode("rainbow route").CurrentStage = 1
		Tracker:FindObjectForCode("moonlight mansion").CurrentStage = 1
		Tracker:FindObjectForCode("cabbage cavern").CurrentStage = 1
		Tracker:FindObjectForCode("mustard mountain").CurrentStage = 1
		Tracker:FindObjectForCode("carrot castle").CurrentStage = 1
		Tracker:FindObjectForCode("olive ocean").CurrentStage = 1
		Tracker:FindObjectForCode("peppermint palace").CurrentStage = 1
		Tracker:FindObjectForCode("radish ruins").CurrentStage = 1
		Tracker:FindObjectForCode("candy constellation").CurrentStage = 1
    end
	
    if slot_data["starting_kirby_color"] then
		if slot_data["starting_kirby_color"] == 0 then
			Tracker:FindObjectForCode("pink").CurrentStage = 1

		elseif slot_data["starting_kirby_color"] == 1 then
			Tracker:FindObjectForCode("yellow").CurrentStage = 1

		elseif slot_data["starting_kirby_color"] == 2 then
			Tracker:FindObjectForCode("red").CurrentStage = 1

		elseif slot_data["starting_kirby_color"] == 3 then
			Tracker:FindObjectForCode("green").CurrentStage = 1

		elseif slot_data["starting_kirby_color"] == 4 then
			Tracker:FindObjectForCode("snow").CurrentStage = 1

		elseif slot_data["starting_kirby_color"] == 5 then
			Tracker:FindObjectForCode("carbon").CurrentStage = 1

		elseif slot_data["starting_kirby_color"] == 6 then
			Tracker:FindObjectForCode("ocean").CurrentStage = 1

		elseif slot_data["starting_kirby_color"] == 7 then
			Tracker:FindObjectForCode("sapphire").CurrentStage = 1

		elseif slot_data["starting_kirby_color"] == 8 then
			Tracker:FindObjectForCode("grape").CurrentStage = 1

		elseif slot_data["starting_kirby_color"] == 9 then
			Tracker:FindObjectForCode("emerald").CurrentStage = 1

		elseif slot_data["starting_kirby_color"] == 10 then
			Tracker:FindObjectForCode("orange").CurrentStage = 1

		elseif slot_data["starting_kirby_color"] == 11 then
			Tracker:FindObjectForCode("chocolate").CurrentStage = 1

		elseif slot_data["starting_kirby_color"] == 12 then
			Tracker:FindObjectForCode("cherry").CurrentStage = 1

		elseif slot_data["starting_kirby_color"] == 13 then
			Tracker:FindObjectForCode("charcoal").CurrentStage = 1

		end
	
    end
	
	
    if slot_data["ground_items"] then
        if slot_data["ground_items"] == true then
            Tracker:FindObjectForCode("ground_items").CurrentStage = 1
			
        end
    end

    if slot_data["room_sanity"] then
        if slot_data["room_sanity"] == true then
            Tracker:FindObjectForCode("roomsanity").CurrentStage = 1
			
        end
    end

    if slot_data["ability_randomization_passive_enemies"] then
        if slot_data["ability_randomization_passive_enemies"] == true then
            Tracker:FindObjectForCode("passive").CurrentStage = 1
			
        end
    end

    if slot_data["ability_randomization_minny"] then
        if slot_data["ability_randomization_minny"] == true then
            Tracker:FindObjectForCode("minny").CurrentStage = 1
			
        end
    end


    if slot_data["ability_randomization_minibosses"] then
        if slot_data["ability_randomization_minibosses"] == true then
            Tracker:FindObjectForCode("minibosses").CurrentStage = 1
			
        end
    end


    if slot_data["ability_randomization_boss_spawns"] then
        if slot_data["ability_randomization_boss_spawns"] == true then
            Tracker:FindObjectForCode("boss_spawn").CurrentStage = 1
			
        end
    end

	
	
 --   if slot_data["ability_randomization_minny"] then
--		print("ability_randomization_minny", dump_table(slot_data["ability_randomization_minny"]))
--	end
	
	
 ---   if slot_data["garib_order"] then
---		print("Garib Order", dump_table(slot_data["garib_order"]))
---	end
	
	--print(string.format"Current Garib Sorting Current:", dump_table(GARIB_SORTING_MAPPING[SLOT_DATA["garib_order"]["0"]][1]))
	--print(string.format"Current Garib Sorting Max:", dump_table(GARIB_SORTING_MAPPING[SLOT_DATA["garib_order"]["1"]][2]))



	apply_slot_data(slot_data)
	LOCAL_ITEMS = {}
	GLOBAL_ITEMS = {}
	-- setup data storage tracking for hint tracking
	local data_strorage_keys = {}
	if PopVersion >= "0.32.0" then
		data_strorage_keys = { getHintDataStorageKey() }
	end
	-- subscribes to the data storage keys for updates
	-- triggers callback in the SetNotify handler on update
	Archipelago:SetNotify(data_strorage_keys)
	-- gets the current value for the data storage keys
	-- triggers callback in the Retrieved handler when result is received
	Archipelago:Get(data_strorage_keys)
	Tracker.BulkUpdate = false
end


---@param mult integer
---@param index integer


-- called when an item gets collected
function onItem(index, item_id, item_name, player_number)
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("called onItem: %s, %s, %s, %s, %s", index, item_id, item_name, player_number, CUR_INDEX))
	end
	if not AUTOTRACKER_ENABLE_ITEM_TRACKING then
		return
	end
	if index <= CUR_INDEX then
		return
	end
	local is_local = player_number == Archipelago.PlayerNumber
	CUR_INDEX = index
	local mapping_entry = ITEM_MAPPING[item_id]
	if not mapping_entry then
		if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
			print(string.format("onItem: could not find item mapping for id %s", item_id))
		end
		return
	end
	
	for _, item_table in pairs(mapping_entry) do
		if item_table then
			local item_code = item_table[1]
			local item_type = item_table[2]
			local multiplier = item_table[3] or 1
			
			local obj = Tracker:FindObjectForCode(item_code)
		
			if item_code then
				
				incrementItem(item_code, item_type, multiplier)
				if item_type == "toggle" then
					obj.Active = true

				elseif item_type == "progressive" then
					if obj.Active then
						obj.CurrentStage = obj.CurrentStage + 1
					else
						obj.Active = true
					end
					
				elseif item_type == "consumable" then
				--	obj.AcquiredCount = obj.AcquiredCount + 1

				elseif item_type == "consumable_sort" then
					IncrementLevels(multiplier)
				

					


				
				elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
					print(string.format("onItem: unknown item type %s for code %s", item_type, item_code))
				end
			elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
				print(string.format("onClear: skipping item_table with no item_code"))
			end
		elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
			print(string.format("onClear: skipping empty item_table"))
		end
	end
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("local items: %s", dump_table(LOCAL_ITEMS)))
		print(string.format("global items: %s", dump_table(GLOBAL_ITEMS)))
	end
end

-- called when a location gets cleared
function onLocation(location_id, location_name)
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("called onLocation: %s, %s", location_id, location_name))
	end
	if not AUTOTRACKER_ENABLE_LOCATION_TRACKING then
		return
	end
	local mapping_entry = LOCATION_MAPPING[location_id]
	if not mapping_entry then
		if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
			print(string.format("onLocation: could not find location mapping for id %s", location_id))
		end
		return
	end
	for _, location_table in pairs(mapping_entry) do
		if location_table then
			local location_code = location_table[1]
			if location_code then
				local obj = Tracker:FindObjectForCode(location_code)
				if obj then
					if location_code:sub(1, 1) == "@" then
						obj.AvailableChestCount = obj.AvailableChestCount - 1
					else
						-- increment hosted item
						local item_type = location_table[2]
						incrementItem(location_code, item_type)
					end
				elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
					print(string.format("onLocation: could not find object for code %s", location_code))
				end
			elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
				print(string.format("onLocation: skipping location_table with no location_code"))
			end
		elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
			print(string.format("onLocation: skipping empty location_table"))
		end
	end
end

-- called when a locations is scouted
function onScout(location_id, location_name, item_id, item_name, item_player)
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("called onScout: %s, %s, %s, %s, %s", location_id, location_name, item_id, item_name,
			item_player))
	end
	-- not implemented yet :(
end

-- called when a bounce message is received
function onBounce(json)
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("called onBounce: %s", dump_table(json)))
	end
	-- your code goes here
end


function onNotify(key, value, old_value)
	print(string.format("called onNotify: %s, %s, %s",key,value,old_value))
	

	if key == DATA_STORAGE_ID then
		updateTab(value)
	end
	
end

function onNotifyLaunch(key, value)
	print(string.format("called onNotifyLaunch: %s, %s",key,value))
	
	if key == DATA_STORAGE_ID then
		updateTab(value)
	end
	
end

function rerun_updateTab(value)
	print(string.format("called onNotifyLaunch: %s",value))
	
	if value == "room_switch" then
		Archipelago:Get({DATA_STORAGE_ID})
	end
	
end

function rerun_updateTab2(value)
	print(string.format("called onNotifyLaunch: %s",value))
	
	if value == "tab_switch" then
		Archipelago:Get({DATA_STORAGE_ID})
	end
	
end

function updateTab(value)
	
	if value ~= nil then
	    print("updateTab",value)
		local tabswitch = Tracker:FindObjectForCode("tab_switch")
		local tabswitch2 = Tracker:FindObjectForCode("room_switch")
		
							
		print("Updating Current Location:", (TAB_MAPPING[value])[5])			
		Tracker:FindObjectForCode("current_location").CurrentStage = (TAB_MAPPING[value])[5]
		
		if tabswitch.CurrentStage == 0 then
		
			if TAB_MAPPING[value] then
				CURRENT_ROOM = TAB_MAPPING[value]
                 do
					print(string.format("Updating  Tab to %s",CURRENT_ROOM[1]))	
					Tracker:UiHint("ActivateTab", CURRENT_ROOM[1])	
					
						if tabswitch2.CurrentStage == 0 then
							Tracker:UiHint("ActivateTab", CURRENT_ROOM[2])	
							print(string.format("Updating  Tab to %s",CURRENT_ROOM[2]))	
							Tracker:UiHint("ActivateTab", CURRENT_ROOM[3])	
							print(string.format("Updating  Tab to %s",CURRENT_ROOM[3]))	
						else
							
							Tracker:UiHint("ActivateTab", CURRENT_ROOM[4])	
							print(string.format("Updating  Tab to %s",CURRENT_ROOM[4]))	
						end
						
							
						print("Updating Current Location:", CURRENT_ROOM[5])			
						Tracker:FindObjectForCode("current_location").CurrentStage = CURRENT_ROOM[5]
						
					end
			else
				CURRENT_ROOM = TAB_MAPPING[value]
				print(string.format("Failed to find ID %s",value))
			end
		end
	end
end




-- called whenever Archipelago:Get returns data from the data storage or
-- whenever a subscribed to (via Archipelago:SetNotify) key in data storgae is updated
-- oldValue might be nil (always nil for "_read" prefixed keys and via retrieved handler (from Archipelago:Get))
function onDataStorageUpdate(key, value, oldValue)
	--if you plan to only use the hints key, you can remove this if
	if key == getHintDataStorageKey() then
		onHintsUpdate(value)
	end
end

-- called whenever the hints key in data storage updated
-- NOTE: this should correctly handle having multiple mapped locations in a section.
--       if you only map sections 1 to 1 you can simplfy this. for an example see
--       https://github.com/Cyb3RGER/sm_ap_tracker/blob/main/scripts/autotracking/archipelago.lua
function onHintsUpdate(hints)
	-- Highlight is only supported since version 0.32.0
	if PopVersion < "0.32.0" or not AUTOTRACKER_ENABLE_LOCATION_TRACKING then
		return
	end
	local player_number = Archipelago.PlayerNumber
	-- get all new highlight values per section
	local sections_to_update = {}
	for _, hint in ipairs(hints) do
		-- we only care about hints in our world
		if hint.finding_player == player_number then
			updateHint(hint, sections_to_update)
		end
	end
	-- update the sections
	for location_code, highlight_code in pairs(sections_to_update) do
		-- find the location object
		local obj = Tracker:FindObjectForCode(location_code)
		-- check if we got the location and if it supports Highlight
		if obj and obj.Highlight then
			obj.Highlight = highlight_code
		end
	end
end

-- update section highlight based on the hint
function updateHint(hint, sections_to_update)
	-- get the highlight enum value for the hint status
	local hint_status = hint.status
	local highlight_code = nil
	if hint_status then
		highlight_code = HINT_STATUS_MAPPING[hint_status]
	end
	if not highlight_code then
		if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
			print(string.format("updateHint: unknown hint status %s for hint on location id %s", hint.status,
				hint.location))
		end
		-- try to "recover" by checking hint.found (older AP versions without hint.status)
		if hint.found == true then
			highlight_code = Highlight.None
		elseif hint.found == false then
			highlight_code = Highlight.Unspecified
		else
			return
		end
	end
	-- get the location mapping for the location id
	local mapping_entry = LOCATION_MAPPING[hint.location]
	if not mapping_entry then
		if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
			print(string.format("updateHint: could not find location mapping for id %s", hint.location))
		end
		return
	end
	--get the "highest" highlight value pre section
	for _, location_table in pairs(mapping_entry) do
		if location_table then
			local location_code = location_table[1]
			-- skip hosted items, they don't support Highlight
			if location_code and location_code:sub(1, 1) == "@" then
				-- see if we already set a Highlight for this section
				local existing_highlight_code = sections_to_update[location_code]
				if existing_highlight_code then
					-- make sure we only replace None or "increase" the highlight but never overwrite with None
					-- this so sections with mulitple mapped locations show the "highest" Highlight and
					-- only show no Highlight when all hints are found
					if existing_highlight_code == Highlight.None or (existing_highlight_code < highlight_code and highlight_code ~= Highlight.None) then
						sections_to_update[location_code] = highlight_code
					end
				else
					sections_to_update[location_code] = highlight_code
				end
			end
		end
	end
end

-- add AP callbacks
-- un-/comment as needed
Archipelago:AddClearHandler("clear handler", onClear)
if AUTOTRACKER_ENABLE_ITEM_TRACKING then
	Archipelago:AddItemHandler("item handler", onItem)
end
if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
	Archipelago:AddLocationHandler("location handler", onLocation)
end
Archipelago:AddSetReplyHandler("notify handler", onNotify)
Archipelago:AddRetrievedHandler("notify launch handler", onNotifyLaunch)
Archipelago:AddRetrievedHandler("retrieved handler", onDataStorageUpdate)
Archipelago:AddSetReplyHandler("set reply handler", onDataStorageUpdate)
ScriptHost:AddWatchForCode("Re-Run UpdateTab", "room_switch", rerun_updateTab)
ScriptHost:AddWatchForCode("Re-Run UpdateTab2", "tab_switch", rerun_updateTab2)
-- Archipelago:AddScoutHandler("scout handler", onScout)
-- Archipelago:AddBouncedHandler("bounce handler", onBounce)
