-- use this file to map the AP item ids to your items
-- first value is the code of the target item and the second is the item type override. The third value is an optional increment multiplier for consumables. (feel free to expand the table with any other values you might need (i.e. special initial values, etc.)!)
-- here are the SM items as an example: https://github.com/Cyb3RGER/sm_ap_tracker/blob/main/scripts/autotracking/item_mapping.lua
BASE_ITEM_ID = 3860000
ITEM_MAPPING = {
	[BASE_ITEM_ID + 00001] = { { "1-up" } },
	[BASE_ITEM_ID + 00026] = { { "small food" } },
	[BASE_ITEM_ID + 00027] = { { "battery" } },
	[BASE_ITEM_ID + 00028] = { { "max tomato" } },
	[BASE_ITEM_ID + 00029] = { { "invincibility candy" } },
	[BASE_ITEM_ID + 00030] = { { "energy drink" } },
	[BASE_ITEM_ID + 00031] = { { "hunk of meat" } },
	
	[BASE_ITEM_ID + 00002] = { { "mirror_c" } },
	[BASE_ITEM_ID + 00003] = { { "mirror_c" } },
	[BASE_ITEM_ID + 00004] = { { "mirror_c" } },
	[BASE_ITEM_ID + 00005] = { { "mirror_c" } },
	[BASE_ITEM_ID + 00006] = { { "mirror_c" } },
	[BASE_ITEM_ID + 00007] = { { "mirror_c" } },
	[BASE_ITEM_ID + 00008] = { { "mirror_c" } },
	[BASE_ITEM_ID + 00009] = { { "mirror_c" } },

	[BASE_ITEM_ID + 00025] = { { "sound player" } },
	
	[BASE_ITEM_ID + 00018] = { { "carrot vitality" } },
	[BASE_ITEM_ID + 00019] = { { "olive vitality" } },
	[BASE_ITEM_ID + 00020] = { { "radish vitality" } },
	[BASE_ITEM_ID + 00021] = { { "candy vitality" } },
}
