-- use this file to map the AP location ids to your locations
-- first value is the code of the target location/item and the second is the item type override (feel free to expand the table with any other values you might need (i.e. special initial values, increments, etc.)!)
-- to reference a location in Pop use @ in the beginning and then path to the section (more info: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#locations)
-- to reference an item use it's code
-- here are the SM locations as an example: https://github.com/Cyb3RGER/sm_ap_tracker/blob/main/scripts/autotracking/location_mapping.lua
BASE_LOCATION_ID = 3960000
LOCATION_MAPPING = {

	------ Beat Bosses ------


	[BASE_LOCATION_ID + 00000] = { { "@Mustard Mountain/Boss/Beat Kracko/" } },
	[BASE_LOCATION_ID + 00001] = { { "@Moonlight Mansion/Boss/Beat King Golem/" } },
	[BASE_LOCATION_ID + 00002] = { { "@Candy Constellation/Boss/Beat Master and Crazy Hand/" } },
	[BASE_LOCATION_ID + 00003] = { { "@Olive Ocean/Boss/Beat Gobbler/" } },
	[BASE_LOCATION_ID + 00004] = { { "@Peppermint Palace/Boss/Beat Wiz/" } },
	[BASE_LOCATION_ID + 00005] = { { "@Cabbage Cavern/Boss/Beat Moley/" } },
	[BASE_LOCATION_ID + 00006] = { { "@Carrot Castle/Boss/Beat Mega Titan/" } },
	[BASE_LOCATION_ID + 00007] = { { "@Radish Ruins/Boss/Beat Meta Knight/" } },
	

	------ Big Chests/Switches/Levers -----


	[3960209] = { { "@Rainbow Route/Tutorial Big Chest/" } },
	[3960200] = { { "@Cabagge Cavern/Goal/Big Chest/" } },
	[3960201] = { { "@Olive Ocean/Chest 2/Big Chest/" } },
	[3960202] = { { "@Peppermint Palace/Chest/Big Chest/" } },
	[3960203] = { { "@Rainbow Route/Hub 1/Big Chest/" } },
	[3960204] = { { "@Moonlight Mansion/Entrance/Big Chest/" } },
	[3960205] = { { "@Mustard Mountain/Chest/Big Chest/" } },
	[3960206] = { { "@Carrot Castle/Chest 2/Big Chest/" } },
	[3960207] = { { "@Radish Ruins/Chest 2/Big Chest/" } },
	[3960208] = { { "@Candy Constelation/Chest 3/Big Chest/" } },
	[3960300] = { { "@Carrot Castle/Chest 1/Big Chest/" } },
	[3960301] = { { "@Olive Ocean/Chest 1/Big Chest/" } },
	[3960302] = { { "@Radish Ruins/Chest 1/Big Chest/" } },
	[3960303] = { { "@Candy Constelation/Chest 2/Big Chest/" } },
	[3960304] = { { "@Candy Constelation/Chest 1/Big Chest/" } },
	
	[3960400] = { { "@Pepermint Palace/Hub 2/Large Switch/" } },
	[3960401] = { { "@Moonlight Mansion/Hub/Large Switch/" } },
	[3960402] = { { "@Rainbow Route/Hub 2/Large Switch/" } },
	[3960403] = { { "@Cabbage Cavern/Hub 2/Large Switch/" } },
	[3960404] = { { "@Rainbow Route/Hub 3/Large Switch/" } },
	[3960405] = { { "@Carrot Castle/Hub/Large Switch/" } },
	[3960406] = { { "@Rainbow Route/Hub 4/Large Switch/" } },
	[3960407] = { { "@Mustard Mountain/Hub/Large Switch/" } },
	[3960408] = { { "@Cabbage Cavern/Hub 3/Large Switch/" } },
	[3960409] = { { "@Radish Ruins/Hub/Large Switch/" } },
	[3960410] = { { "@Pepermint Palace/Hub 1/Large Switch/" } },
	[3960411] = { { "@Moonlight Mansion/Room 9/Large Switch/" } },
	[3960412] = { { "@Cabbage Cavern/Hub 1/Large Switch/" } },
	[3960413] = { { "@Olive Ocean/Hub/Large Switch/" } },
	[3960414] = { { "@Candy Constelation/Hub/Large Switch/" } },

	[3960415] = { { "@Moonlight Mansion/Room 11/Lever/" } },
	[3960416] = { { "@Olive Ocean/Room 13/Lever/" } },
	[3960417] = { { "@Carrot Castle/Room 5/Lever/" } },
	[3960418] = { { "@Radish Ruins/Room 12/Lever/" } },


	------ Small Chests ------


	[3960566] = { { "@Rainbow Route/Room 2/Small Chest/" } },
	[3960567] = { { "@Rainbow Route/Room 6/Small Chest/" } },
	[3960582] = { { "@Rainbow Route/Room 18/Small Chest/" } },
	[3960503] = { { "@Rainbow Route/Room 28/Small Chest/" } },
	[3960580] = { { "@Rainbow Route/Room 33/Small Chest/" } },
	[3960514] = { { "@Rainbow Route/Room 39/Small Chest/" } },
	[3960581] = { { "@Rainbow Route/Goal 1/Small Chest/" } },
	[3960583] = { { "@Rainbow Route/Goal 2/Small Chest/" } },
	[3960568] = { { "@Rainbow Route/Goal 3/Small Chest/" } },

	[3960510] = { { "@Moonlight Mansion/Room 7/Small Chest/" } },
	[3960585] = { { "@Moonlight Mansion/Room 15/Small Chest/" } },
	[3960521] = { { "@Moonlight Mansion/Room 17/Small Chest/" } },
	[3960569] = { { "@Moonlight Mansion/Room 20/Small Chest/" } },
	[3960513] = { { "@Moonlight Mansion/Goal 2/Left Small Chest/" } },
	[3960584] = { { "@Moonlight Mansion/Goal 2/Right Small Chest/" } },

	[3960522] = { { "@Cabbage Cavern/Room 5/Small Chest/" } },
	[3960511] = { { "@Cabbage Cavern/Room 6/Small Chest/" } },
	[3960576] = { { "@Cabbage Cavern/Room 9/Small Chest/" } },
	[3960516] = { { "@Cabbage Cavern/Room 12/Small Chest/" } },
	[3960507] = { { "@Cabbage Cavern/Room 14/Small Chest/" } },
	[3960577] = { { "@Cabbage Cavern/Room 15/Small Chest/" } },
	[3960600] = { { "@Cabbage Cavern/Goal/Small Chest/" } },

	[3960573] = { { "@Mustard Mountain/Room 5/Small Chest/" } },
	[3960597] = { { "@Mustard Mountain/Room 10/Small Chest/" } },
	[3960574] = { { "@Mustard Mountain/Room 11/Small Chest/" } },
	[3960512] = { { "@Mustard Mountain/Goal 2/Small Chest/" } },

	[3960605] = { { "@Carrot Castle/Room 7/Small Chest/" } },
	[3960519] = { { "@Carrot Castle/Room 13/Small Chest Top/" } },
	[3960606] = { { "@Carrot Castle/Room 13/Small Chest Bottom/" } },
	[3960501] = { { "@Carrot Castle/Room 16/Small Chest/" } },

	[3960602] = { { "@Olive Ocean/Room 3/Small Chest/" } },
	[3960506] = { { "@Olive Ocean/Room 6/Small Chest/" } },
	[3960601] = { { "@Olive Ocean/Room 9/Small Chest/" } },
	[3960578] = { { "@Olive Ocean/Room 16/Small Chest/" } },
	[3960523] = { { "@Olive Ocean/Goal 2/Small Chest/" } },

	[3960570] = { { "@Peppermint Palace/Room 2/Small Chest 1/" } },
	[3960586] = { { "@Peppermint Palace/Room 2/Small Chest 2/" } },
	[3960504] = { { "@Peppermint Palace/Room 5/Small Chest/" } },
	[3960590] = { { "@Peppermint Palace/Room 6/Small Chest 1/" } },
	[3960591] = { { "@Peppermint Palace/Room 6/Small Chest 2/" } },
	[3960515] = { { "@Peppermint Palace/Room 6/Small Chest 3/" } },
	[3960518] = { { "@Peppermint Palace/Room 8/Small Chest/" } },
	[3960571] = { { "@Peppermint Palace/Room 9/Small Chest 1/" } },
	[3960592] = { { "@Peppermint Palace/Room 9/Small Chest 2/" } },
	[3960508] = { { "@Peppermint Palace/Room 10/Small Chest 1/" } },
	[3960593] = { { "@Peppermint Palace/Room 10/Small Chest 2/" } },
	[3960594] = { { "@Peppermint Palace/Room 10/Small Chest 3/" } },
	[3960589] = { { "@Peppermint Palace/Room 13/Small Chest/" } },
	[3960595] = { { "@Peppermint Palace/Room 14/Small Chest/" } },
	[3960572] = { { "@Peppermint Palace/Room 19/Small Chest/" } },
	[3960500] = { { "@Peppermint Palace/Room 22/Small Chest/" } },
	[3960587] = { { "@Peppermint Palace/Chest/Small Chest 1/" } },
	[3960588] = { { "@Peppermint Palace/Chest/Small Chest 2/" } },
	[3960596] = { { "@Peppermint Palace/Goal 2/Small Chest/" } },

	[3960603] = { { "@Radish Ruins/Room 7/Small Chest/" } },
	[3960579] = { { "@Radish Ruins/Room 11/Small Chest/" } },
	[3960517] = { { "@Radish Ruins/Room 22/Small Chest 1/" } },
	[3960604] = { { "@Radish Ruins/Room 22/Small Chest 2/" } },
	[3960509] = { { "@Radish Ruins/Goal 1/Small Chest/" } },

	[3960502] = { { "@Candy Constellation/Room 2/Small Chest/" } },
	[3960599] = { { "@Candy Constellation/Room 3/Small Chest/" } },
	[3960598] = { { "@Candy Constellation/Room 10/Small Chest/" } },
	[3960575] = { { "@Candy Constellation/Room 12/Small Chest/" } },
	[3960520] = { { "@Candy Constellation/Room 16/Small Chest/" } },
	[3960505] = { { "@Candy Constellation/Chest 2/Small Chest/" } },


	------ Enter Rooms ------


	[3960451] = {{ "@Rainbow Route/First Visit/" }},
	[3961000] = {{ "@Rainbow Route/Enter Central Hub/" }},
	[3961022] = {{ "@Rainbow Route/Hub 1/Enter Rainbow Route Hub 1/" }},
	[3961026] = {{ "@Rainbow Route/Hub 2/Enter Rainbow Route Hub 2/" }},
	[3961049] = {{ "@Rainbow Route/Hub 3/Enter Rainbow Route Hub 3/" }},
	[3961011] = {{ "@Rainbow Route/Hub 4/Enter Rainbow Route Hub 4/" }},
	[3961033] = {{ "@Rainbow Route/Goal 1/Enter Rainbow Route Goal 1/" }},
	[3961046] = {{ "@Rainbow Route/Goal 2/Enter Rainbow Route Goal 2/" }},
	[3961047] = {{ "@Rainbow Route/Goal 3/Enter Rainbow Route Goal 3/" }},
	[3961257] = {{ "@Rainbow Route/Warp/Enter Rainbow Route Warp/"}},

	[3961012] = {{ "@Rainbow Route/Room 1/Enter Rainbow Route Room 1/" }},
	[3961015] = {{ "@Rainbow Route/Room 2/Enter Rainbow Route Room 2/" }},
	[3961016] = {{ "@Rainbow Route/Room 3/Enter Rainbow Route Room 3/" }},
	[3961014] = {{ "@Rainbow Route/Room 4/Enter Rainbow Route Room 4/" }},
	[3961013] = {{ "@Rainbow Route/Room 5/Enter Rainbow Route Room 5/" }},
	[3961017] = {{ "@Rainbow Route/Room 6/Enter Rainbow Route Room 6/" }},
	[3961019] = {{ "@Rainbow Route/Room 7/Enter Rainbow Route Room 7/" }},
	[3961018] = {{ "@Rainbow Route/Room 8/Enter Rainbow Route Room 8/" }},
	[3961029] = {{ "@Rainbow Route/Room 9/Enter Rainbow Route Room 9/" }},
	[3961030] = {{ "@Rainbow Route/Room 10/Enter Rainbow Route Room 10/" }},
	[3961032] = {{ "@Rainbow Route/Room 11/Enter Rainbow Route Room 11/" }},
	[3961031] = {{ "@Rainbow Route/Room 12/Enter Rainbow Route Room 12/" }},
	[3961028] = {{ "@Rainbow Route/Room 13/Enter Rainbow Route Room 13/" }},
	[3961025] = {{ "@Rainbow Route/Room 14/Enter Rainbow Route Room 14/" }},
	[3961023] = {{ "@Rainbow Route/Room 15/Enter Rainbow Route Room 15/" }},
	[3961027] = {{ "@Rainbow Route/Room 16/Enter Rainbow Route Room 16/" }},
	[3961044] = {{ "@Rainbow Route/Room 17/Enter Rainbow Route Room 17/" }},
	[3961043] = {{ "@Rainbow Route/Room 18/Enter Rainbow Route Room 18/" }},
	[3961045] = {{ "@Rainbow Route/Room 19/Enter Rainbow Route Room 19/" }},
	[3961042] = {{ "@Rainbow Route/Room 20/Enter Rainbow Route Room 20/" }},
	[3961041] = {{ "@Rainbow Route/Room 21/Enter Rainbow Route Room 21/" }},
	[3961038] = {{ "@Rainbow Route/Room 22/Enter Rainbow Route Room 22/" }},
	[3961037] = {{ "@Rainbow Route/Room 23/Enter Rainbow Route Room 23/" }},
	[3961036] = {{ "@Rainbow Route/Room 24/Enter Rainbow Route Room 24/" }},
	[3961035] = {{ "@Rainbow Route/Room 25/Enter Rainbow Route Room 25/" }},
	[3961040] = {{ "@Rainbow Route/Room 26/Enter Rainbow Route Room 26/" }},
	[3961001] = {{ "@Rainbow Route/Room 27/Enter Rainbow Route Room 27/" }},
	[3961039] = {{ "@Rainbow Route/Room 28/Enter Rainbow Route Room 28/" }},
	[3961048] = {{ "@Rainbow Route/Room 29/Enter Rainbow Route Room 29/" }},
	[3961010] = {{ "@Rainbow Route/Room 30/Enter Rainbow Route Room 30/" }},
	[3961024] = {{ "@Rainbow Route/Room 31/Enter Rainbow Route Room 31/" }},
	[3961034] = {{ "@Rainbow Route/Room 32/Enter Rainbow Route Room 32/" }},
	[3961009] = {{ "@Rainbow Route/Room 33/Enter Rainbow Route Room 33/" }},
	[3961002] = {{ "@Rainbow Route/Room 34/Enter Rainbow Route Room 34/" }},
	[3961003] = {{ "@Rainbow Route/Room 35/Enter Rainbow Route Room 35/" }},
	[3961006] = {{ "@Rainbow Route/Room 36/Enter Rainbow Route Room 36/" }},
	[3961007] = {{ "@Rainbow Route/Room 37/Enter Rainbow Route Room 37/" }},
	[3961004] = {{ "@Rainbow Route/Room 38/Enter Rainbow Route Room 38/" }},
	[3961005] = {{ "@Rainbow Route/Room 39/Enter Rainbow Route Room 39/" }},
	[3961008] = {{ "@Rainbow Route/Room 40/Enter Rainbow Route Room 40/" }},
	[3961020] = {{ "@Rainbow Route/Room 41/Enter Rainbow Route Room 41/" }},
	[3961021] = {{ "@Rainbow Route/Room 42/Enter Rainbow Route Room 42/" }},










	[3960452] = {{ "@Moonlight Mansion/First Visit/" }},
	[3961057] = {{ "@Moonlight Mansion/Entrance/Enter Moonlight Mansion Entrance/" }},
	[3961070] = {{ "@Moonlight Mansion/Hub/Enter Moonlight Mansion Hub/" }},
	[3961074] = {{ "@Moonlight Mansion/Goal 1/Enter Moonlight Mansion Goal 1/" }},
	[3961055] = {{ "@Moonlight Mansion/Goal 2/Enter Moonlight Mansion Goal 2/" }},
	[3961258] = {{ "@Moonlight Mansion/Warp/Enter Moonlight Mansion Warp/" }},
	[3961064] = {{ "@Moonlight Mansion/Boss/Enter Moonlight Mansion Boss/" }},
	
	[3961062] = {{ "@Moonlight Mansion/Room 1/Enter Moonlight Mansion Room 1/" }},
	[3961067] = {{ "@Moonlight Mansion/Room 2/Enter Moonlight Mansion Room 2/" }},
	[3961060] = {{ "@Moonlight Mansion/Room 3/Enter Moonlight Mansion Room 3/" }},
	[3961061] = {{ "@Moonlight Mansion/Room 4/Enter Moonlight Mansion Room 4/" }},
	[3961071] = {{ "@Moonlight Mansion/Room 5/Enter Moonlight Mansion Room 5/" }},
	[3961073] = {{ "@Moonlight Mansion/Room 6/Enter Moonlight Mansion Room 6/" }},
	[3961063] = {{ "@Moonlight Mansion/Room 7/Enter Moonlight Mansion Room 7/" }},
	[3961059] = {{ "@Moonlight Mansion/Room 8/Enter Moonlight Mansion Room 8/" }},
	[3961065] = {{ "@Moonlight Mansion/Room 9/Enter Moonlight Mansion Room 9/" }},
	[3961058] = {{ "@Moonlight Mansion/Room 10/Enter Moonlight Mansion Room 10/" }},
	[3961072] = {{ "@Moonlight Mansion/Room 11/Enter Moonlight Mansion Room 11/" }},
	[3961050] = {{ "@Moonlight Mansion/Room 12/Enter Moonlight Mansion Room 12/" }},
	[3961066] = {{ "@Moonlight Mansion/Room 13/Enter Moonlight Mansion Room 13/" }},
	[3961068] = {{ "@Moonlight Mansion/Room 14/Enter Moonlight Mansion Room 14/" }},
	[3961069] = {{ "@Moonlight Mansion/Room 15/Enter Moonlight Mansion Room 15/" }},
	[3961051] = {{ "@Moonlight Mansion/Room 16/Enter Moonlight Mansion Room 16/" }},
	[3961052] = {{ "@Moonlight Mansion/Room 17/Enter Moonlight Mansion Room 17/" }},
	[3961053] = {{ "@Moonlight Mansion/Room 18/Enter Moonlight Mansion Room 18/" }},
	[3961054] = {{ "@Moonlight Mansion/Room 19/Enter Moonlight Mansion Room 19/" }},
	[3961056] = {{ "@Moonlight Mansion/Room 20/Enter Moonlight Mansion Room 20/" }},










	[3960453] = {{ "@Cabbage Cavern/First Visit/" }},
	[3961094] = {{ "@Cabbage Cavern/Hub 1/Enter Cabbage Cavern Hub 1/" }},
	[3961093] = {{ "@Cabbage Cavern/Hub 2/Enter Cabbage Cavern Hub 2/" }},
	[3961095] = {{ "@Cabbage Cavern/Hub 3/Enter Cabbage Cavern Hub 3/" }},
	[3961092] = {{ "@Cabbage Cavern/Goal/Enter Cabbage Cavern Goal/" }},
	[3961079] = {{ "@Cabbage Cavern/Boss/Enter Cabbage Cavern Boss/" }},
	
	[3961088] = {{ "@Cabbage Cavern/Room 1/Enter Cabbage Cavern Room 1/" }},
	[3961091] = {{ "@Cabbage Cavern/Room 2/Enter Cabbage Cavern Room 2/" }},
	[3961090] = {{ "@Cabbage Cavern/Room 3/Enter Cabbage Cavern Room 3/" }},
	[3961083] = {{ "@Cabbage Cavern/Room 4/Enter Cabbage Cavern Room 4/" }},
	[3961082] = {{ "@Cabbage Cavern/Room 5/Enter Cabbage Cavern Room 5/" }},
	[3961087] = {{ "@Cabbage Cavern/Room 6/Enter Cabbage Cavern Room 6/" }},
	[3961085] = {{ "@Cabbage Cavern/Room 7/Enter Cabbage Cavern Room 7/" }},
	[3961081] = {{ "@Cabbage Cavern/Room 8/Enter Cabbage Cavern Room 8/" }},
	[3961078] = {{ "@Cabbage Cavern/Room 9/Enter Cabbage Cavern Room 9/" }},
	[3961077] = {{ "@Cabbage Cavern/Room 10/Enter Cabbage Cavern Room 10/" }},
	[3961076] = {{ "@Cabbage Cavern/Room 11/Enter Cabbage Cavern Room 11/" }},
	[3961080] = {{ "@Cabbage Cavern/Room 12/Enter Cabbage Cavern Room 12/" }},
	[3961084] = {{ "@Cabbage Cavern/Room 13/Enter Cabbage Cavern Room 13/" }},
	[3961089] = {{ "@Cabbage Cavern/Room 14/Enter Cabbage Cavern Room 14/" }},
	[3961086] = {{ "@Cabbage Cavern/Room 15/Enter Cabbage Cavern Room 15/" }},
	[3961075] = {{ "@Cabbage Cavern/Room 16/Enter Cabbage Cavern Room 16/" }},









	[3960454] = {{ "@Mustard Mountain/First Visit/" }},
	[3961119] = {{ "@Mustard Mountain/Hub/Enter Mustard Mountain Hub/" }},
	[3961107] = {{ "@Mustard Mountain/Chest/Enter Mustard Mountain Chest/" }},
	[3961103] = {{ "@Mustard Mountain/Goal 1/Enter Mustard Mountain Goal 1/" }},
	[3961118] = {{ "@Mustard Mountain/Goal 2/Enter Mustard Mountain Goal 2/" }},
	[3961259] = {{ "@Mustard Mountain/Warp/Enter Mustard Mountain Warp/" }},
	[3961116] = {{ "@Mustard Mountain/Boss/Enter Mustard Mountain Boss/" }},
	
	[3961097] = {{ "@Mustard Mountain/Room 1/Enter Mustard Mountain Room 1/" }},
	[3961098] = {{ "@Mustard Mountain/Room 2/Enter Mustard Mountain Room 2/" }},
	[3961099] = {{ "@Mustard Mountain/Room 3/Enter Mustard Mountain Room 3/" }},
	[3961105] = {{ "@Mustard Mountain/Room 4/Enter Mustard Mountain Room 4/" }},
	[3961113] = {{ "@Mustard Mountain/Room 5/Enter Mustard Mountain Room 5/" }},
	[3961100] = {{ "@Mustard Mountain/Room 6/Enter Mustard Mountain Room 6/" }},
	[3961101] = {{ "@Mustard Mountain/Room 7/Enter Mustard Mountain Room 7/" }},
	[3961102] = {{ "@Mustard Mountain/Room 8/Enter Mustard Mountain Room 8/" }},
	[3961106] = {{ "@Mustard Mountain/Room 9/Enter Mustard Mountain Room 9/" }},
	[3961111] = {{ "@Mustard Mountain/Room 10/Enter Mustard Mountain Room 10/" }},
	[3961114] = {{ "@Mustard Mountain/Room 11/Enter Mustard Mountain Room 11/" }},
	[3961110] = {{ "@Mustard Mountain/Room 12/Enter Mustard Mountain Room 12/" }},
	[3961115] = {{ "@Mustard Mountain/Room 13/Enter Mustard Mountain Room 13/" }},
	[3961104] = {{ "@Mustard Mountain/Room 14/Enter Mustard Mountain Room 14/" }},
	[3961096] = {{ "@Mustard Mountain/Room 15/Enter Mustard Mountain Room 15/" }},
	[3961117] = {{ "@Mustard Mountain/Room 16/Enter Mustard Mountain Room 16/" }},
	[3961112] = {{ "@Mustard Mountain/Room 17/Enter Mustard Mountain Room 17/" }},
	[3961108] = {{ "@Mustard Mountain/Room 18/Enter Mustard Mountain Room 18/" }},
	[3961109] = {{ "@Mustard Mountain/Room 19/Enter Mustard Mountain Room 19/" }},










	[3960455] = {{ "@Carrot Castle/First Visit/" }},
	[3961126] = {{ "@Carrot Castle/Hub/Enter Carrot Castle Hub/" }},
	[3961139] = {{ "@Carrot Castle/Chest 1/Enter Carrot Castle Chest 1/" }},
	[3961132] = {{ "@Carrot Castle/Chest 2/Enter Carrot Castle Chest 2/" }},
	[3961260] = {{ "@Carrot Castle/Warp/Enter Carrot Castle Warp/" }},
	[3961138] = {{ "@Carrot Castle/Boss/Enter Carrot Castle Boss/" }},
	
	[3961124] = {{ "@Carrot Castle/Room 1/Enter Carrot Castle Room 1/" }},
	[3961122] = {{ "@Carrot Castle/Room 2/Enter Carrot Castle Room 2/" }},
	[3961123] = {{ "@Carrot Castle/Room 3/Enter Carrot Castle Room 3/" }},
	[3961121] = {{ "@Carrot Castle/Room 4/Enter Carrot Castle Room 4/" }},
	[3961125] = {{ "@Carrot Castle/Room 5/Enter Carrot Castle Room 5/" }},
	[3961120] = {{ "@Carrot Castle/Room 6/Enter Carrot Castle Room 6/" }},
	[3961131] = {{ "@Carrot Castle/Room 7/Enter Carrot Castle Room 7/" }},
	[3961128] = {{ "@Carrot Castle/Room 8/Enter Carrot Castle Room 8/" }},
	[3961135] = {{ "@Carrot Castle/Room 9/Enter Carrot Castle Room 9/" }},
	[3961136] = {{ "@Carrot Castle/Room 10/Enter Carrot Castle Room 10/" }},
	[3961137] = {{ "@Carrot Castle/Room 11/Enter Carrot Castle Room 11/" }},
	[3961127] = {{ "@Carrot Castle/Room 12/Enter Carrot Castle Room 12/" }},
	[3961134] = {{ "@Carrot Castle/Room 13/Enter Carrot Castle Room 13/" }},
	[3961140] = {{ "@Carrot Castle/Room 14/Enter Carrot Castle Room 14/" }},
	[3961141] = {{ "@Carrot Castle/Room 15/Enter Carrot Castle Room 15/" }},
	[3961133] = {{ "@Carrot Castle/Room 16/Enter Carrot Castle Room 16/" }},
	[3961130] = {{ "@Carrot Castle/Room 17/Enter Carrot Castle Room 17/" }},
	[3961129] = {{ "@Carrot Castle/Room 18/Enter Carrot Castle Room 18/" }},










	[3960456] = {{ "@Olive Ocean/First Visit/" }},
	[3961163] = {{ "@Olive Ocean/Hub/Enter Olive Ocean Hub/" }},
	[3961152] = {{ "@Olive Ocean/Chest 1/Enter Olive Ocean Chest 1/" }},
	[3961167] = {{ "@Olive Ocean/Chest 2/Enter Olive Ocean Chest 2/" }},
	[3961147] = {{ "@Olive Ocean/Goal 1/Enter Olive Ocean Goal 1/" }},
	[3961155] = {{ "@Olive Ocean/Goal 2/Enter Olive Ocean Goal 2/" }},
	[3961170] = {{ "@Olive Ocean/Boss/Enter Olive Ocean Boss/" }},
	
	[3961142] = {{ "@Olive Ocean/Room 1/Enter Olive Ocean Room 1/" }},
	[3961143] = {{ "@Olive Ocean/Room 2/Enter Olive Ocean Room 2/" }},
	[3961156] = {{ "@Olive Ocean/Room 3/Enter Olive Ocean Room 3/" }},
	[3961144] = {{ "@Olive Ocean/Room 4/Enter Olive Ocean Room 4/" }},
	[3961145] = {{ "@Olive Ocean/Room 5/Enter Olive Ocean Room 5/" }},
	[3961146] = {{ "@Olive Ocean/Room 6/Enter Olive Ocean Room 6/" }},
	[3961157] = {{ "@Olive Ocean/Room 7/Enter Olive Ocean Room 7/" }},
	[3961158] = {{ "@Olive Ocean/Room 8/Enter Olive Ocean Room 8/" }},
	[3961153] = {{ "@Olive Ocean/Room 9/Enter Olive Ocean Room 9/" }},
	[3961150] = {{ "@Olive Ocean/Room 10/Enter Olive Ocean Room 10/" }},
	[3961159] = {{ "@Olive Ocean/Room 11/Enter Olive Ocean Room 11/" }},
	[3961151] = {{ "@Olive Ocean/Room 12/Enter Olive Ocean Room 12/" }},
	[3961154] = {{ "@Olive Ocean/Room 13/Enter Olive Ocean Room 13/" }},
	[3961161] = {{ "@Olive Ocean/Room 14/Enter Olive Ocean Room 14/" }},
	[3961148] = {{ "@Olive Ocean/Room 15/Enter Olive Ocean Room 15/" }},
	[3961149] = {{ "@Olive Ocean/Room 16/Enter Olive Ocean Room 16/" }},
	[3961162] = {{ "@Olive Ocean/Room 17/Enter Olive Ocean Room 17/" }},
	[3961160] = {{ "@Olive Ocean/Room 18/Enter Olive Ocean Room 18/" }},
	[3961166] = {{ "@Olive Ocean/Room 19/Enter Olive Ocean Room 19/" }},
	[3961165] = {{ "@Olive Ocean/Room 20/Enter Olive Ocean Room 20/" }},
	[3961168] = {{ "@Olive Ocean/Room 21/Enter Olive Ocean Room 21/" }},
	[3961169] = {{ "@Olive Ocean/Room 22/Enter Olive Ocean Room 22/" }},
	[3961164] = {{ "@Olive Ocean/Room 23/Enter Olive Ocean Room 23/" }},










	[3960457] = {{ "@Peppermint Palace/First Visit/" }},
	[3961188] = {{ "@Peppermint Palace/Hub 1/Enter Peppermint Palace Hub 1/" }},
	[3961200] = {{ "@Peppermint Palace/Hub 2/Enter Peppermint Palace Hub 2/" }},
	[3961178] = {{ "@Peppermint Palace/Chest/Enter Peppermint Palace Chest/" }},
	[3961181] = {{ "@Peppermint Palace/Goal 1/Enter Peppermint Palace Goal 1/" }},
	[3961198] = {{ "@Peppermint Palace/Goal 2/Enter Peppermint Palace Goal 2/" }},
	[3961261] = {{ "@Peppermint Palace/Warp/Enter Peppermint Palace Warp/" }},
	[3961194] = {{ "@Peppermint Palace/Boss/Enter Peppermint Palace Boss/" }},
	
	[3961180] = {{ "@Peppermint Palace/Room 1/Enter Pepermint Palace Room 1/" }},
	[3961172] = {{ "@Peppermint Palace/Room 2/Enter Pepermint Palace Room 2/" }},
	[3961177] = {{ "@Peppermint Palace/Room 3/Enter Pepermint Palace Room 3/" }},
	[3961196] = {{ "@Peppermint Palace/Room 4/Enter Pepermint Palace Room 4/" }},
	[3961179] = {{ "@Peppermint Palace/Room 5/Enter Pepermint Palace Room 5/" }},
	[3961183] = {{ "@Peppermint Palace/Room 6/Enter Pepermint Palace Room 6/" }},
	[3961175] = {{ "@Peppermint Palace/Room 7/Enter Pepermint Palace Room 7/" }},
	[3961176] = {{ "@Peppermint Palace/Room 8/Enter Pepermint Palace Room 8/" }},
	[3961184] = {{ "@Peppermint Palace/Room 9/Enter Pepermint Palace Room 9/" }},
	[3961185] = {{ "@Peppermint Palace/Room 10/Enter Pepermint Palace Room 10/" }},
	[3961173] = {{ "@Peppermint Palace/Room 11/Enter Pepermint Palace Room 11/" }},
	[3961174] = {{ "@Peppermint Palace/Room 12/Enter Pepermint Palace Room 12/" }},
	[3961182] = {{ "@Peppermint Palace/Room 13/Enter Pepermint Palace Room 13/" }},
	[3961187] = {{ "@Peppermint Palace/Room 14/Enter Pepermint Palace Room 14/" }},
	[3961199] = {{ "@Peppermint Palace/Room 15/Enter Pepermint Palace Room 15/" }},
	[3961186] = {{ "@Peppermint Palace/Room 16/Enter Pepermint Palace Room 16/" }},
	[3961190] = {{ "@Peppermint Palace/Room 17/Enter Pepermint Palace Room 17/" }},
	[3961189] = {{ "@Peppermint Palace/Room 18/Enter Pepermint Palace Room 18/" }},
	[3961191] = {{ "@Peppermint Palace/Room 19/Enter Pepermint Palace Room 19/" }},
	[3961192] = {{ "@Peppermint Palace/Room 20/Enter Pepermint Palace Room 20/" }},
	[3961197] = {{ "@Peppermint Palace/Room 21/Enter Pepermint Palace Room 21/" }},
	[3961195] = {{ "@Peppermint Palace/Room 22/Enter Pepermint Palace Room 22/" }},
	[3961193] = {{ "@Peppermint Palace/Room 23/Enter Pepermint Palace Room 23/" }},
	[3961171] = {{ "@Peppermint Palace/Room 24/Enter Pepermint Palace Room 24/" }},










	[3960458] = {{ "@Radish Ruins/First Visit/" }},
	[3961221] = {{ "@Radish Ruins/Hub/Enter Radish Ruins Hub/" }},
	[3961206] = {{ "@Radish Ruins/Chest 1/Enter Radish Ruins Chest 1/" }},
	[3961218] = {{ "@Radish Ruins/Chest 2/Enter Radish Ruins Chest 2/" }},
	[3961210] = {{ "@Radish Ruins/Goal 1/Enter Radish Ruins Goal 1/" }},
	[3961225] = {{ "@Radish Ruins/Goal 2/Enter Radish Ruins Goal 2/" }},
	[3961229] = {{ "@Radish Ruins/Boss/Enter Radish Ruins Boss/" }},
	
	[3961208] = {{ "@Radish Ruins/Room 1/Enter Radish Ruins Room 1/" }},
	[3961209] = {{ "@Radish Ruins/Room 2/Enter Radish Ruins Room 2/" }},
	[3961204] = {{ "@Radish Ruins/Room 3/Enter Radish Ruins Room 3/" }},
	[3961201] = {{ "@Radish Ruins/Room 4/Enter Radish Ruins Room 4/" }},
	[3961207] = {{ "@Radish Ruins/Room 5/Enter Radish Ruins Room 5/" }},
	[3961202] = {{ "@Radish Ruins/Room 6/Enter Radish Ruins Room 6/" }},
	[3961211] = {{ "@Radish Ruins/Room 7/Enter Radish Ruins Room 7/" }},
	[3961205] = {{ "@Radish Ruins/Room 8/Enter Radish Ruins Room 8/" }},
	[3961203] = {{ "@Radish Ruins/Room 9/Enter Radish Ruins Room 9/" }},
	[3961214] = {{ "@Radish Ruins/Room 10/Enter Radish Ruins Room 10/" }},
	[3961212] = {{ "@Radish Ruins/Room 11/Enter Radish Ruins Room 11/" }},
	[3961220] = {{ "@Radish Ruins/Room 12/Enter Radish Ruins Room 12/" }},
	[3961215] = {{ "@Radish Ruins/Room 13/Enter Radish Ruins Room 13/" }},
	[3961217] = {{ "@Radish Ruins/Room 14/Enter Radish Ruins Room 14/" }},
	[3961223] = {{ "@Radish Ruins/Room 15/Enter Radish Ruins Room 15/" }},
	[3961222] = {{ "@Radish Ruins/Room 16/Enter Radish Ruins Room 16/" }},
	[3961224] = {{ "@Radish Ruins/Room 17/Enter Radish Ruins Room 17/" }},
	[3961213] = {{ "@Radish Ruins/Room 18/Enter Radish Ruins Room 18/" }},
	[3961216] = {{ "@Radish Ruins/Room 19/Enter Radish Ruins Room 19/" }},
	[3961219] = {{ "@Radish Ruins/Room 20/Enter Radish Ruins Room 20/" }},
	[3961227] = {{ "@Radish Ruins/Room 21/Enter Radish Ruins Room 21/" }},
	[3961226] = {{ "@Radish Ruins/Room 22/Enter Radish Ruins Room 22/" }},
	[3961228] = {{ "@Radish Ruins/Room 23/Enter Radish Ruins Room 23/" }},










	[3960459] = {{ "@Candy Constellation/First Visit/" }},
	[3961256] = {{ "@Candy Constellation/Hub/Enter Candy Constellation Hub/" }},
	[3961236] = {{ "@Candy Constellation/Chest 1/Enter Candy Constellation Chest 1/" }},
	[3961233] = {{ "@Candy Constellation/Chest 2/Enter Candy Constellation Chest 2/" }},
	[3961254] = {{ "@Candy Constellation/Chest 3/Enter Candy Constellation Chest 3/" }},
	[3961241] = {{ "@Candy Constellation/Goal 1/Enter Candy Constellation Goal 1/" }},
	[3961248] = {{ "@Candy Constellation/Goal 2/Enter Candy Constellation Goal 2/" }},
	[3961262] = {{ "@Candy Constellation/Warp/Enter Candy Constellation Warp/" }},
	[3961245] = {{ "@Candy Constellation/Boss/Enter Candy Constellation Boss/" }},
	
	[3961234] = {{ "@Candy Constellation/Room 1/Enter Candy Constellation Room 1/" }},
	[3961255] = {{ "@Candy Constellation/Room 2/Enter Candy Constellation Room 2/" }},
	[3961253] = {{ "@Candy Constellation/Room 3/Enter Candy Constellation Room 3/" }},
	[3961239] = {{ "@Candy Constellation/Room 4/Enter Candy Constellation Room 4/" }},
	[3961238] = {{ "@Candy Constellation/Room 5/Enter Candy Constellation Room 5/" }},
	[3961231] = {{ "@Candy Constellation/Room 6/Enter Candy Constellation Room 6/" }},
	[3961237] = {{ "@Candy Constellation/Room 7/Enter Candy Constellation Room 7/" }},
	[3961240] = {{ "@Candy Constellation/Room 8/Enter Candy Constellation Room 8/" }},
	[3961235] = {{ "@Candy Constellation/Room 9/Enter Candy Constellation Room 9/" }},
	[3961246] = {{ "@Candy Constellation/Room 10/Enter Candy Constellation Room 10/" }},
	[3961242] = {{ "@Candy Constellation/Room 11/Enter Candy Constellation Room 11/" }},
	[3961232] = {{ "@Candy Constellation/Room 12/Enter Candy Constellation Room 12/" }},
	[3961247] = {{ "@Candy Constellation/Room 13/Enter Candy Constellation Room 13/" }},
	[3961243] = {{ "@Candy Constellation/Room 14/Enter Candy Constellation Room 14/" }},
	[3961250] = {{ "@Candy Constellation/Room 15/Enter Candy Constellation Room 15/" }},
	[3961252] = {{ "@Candy Constellation/Room 16/Enter Candy Constellation Room 16/" }},
	[3961251] = {{ "@Candy Constellation/Room 17/Enter Candy Constellation Room 17/" }},
	[3961249] = {{ "@Candy Constellation/Room 18/Enter Candy Constellation Room 18/" }},
	[3961244] = {{ "@Candy Constellation/Room 19/Enter Candy Constellation Room 19/" }},
	[3961230] = {{ "@Candy Constellation/Room 20/Enter Candy Constellation Room 20/" }},


	}
