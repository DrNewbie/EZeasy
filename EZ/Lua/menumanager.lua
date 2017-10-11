core:import("CoreMenuManager")
core:import("CoreMenuCallbackHandler")
require("lib/managers/menu/MenuInput")
require("lib/managers/menu/MenuRenderer")
require("lib/managers/menu/MenuLobbyRenderer")
require("lib/managers/menu/MenuPauseRenderer")
require("lib/managers/menu/MenuKitRenderer")
require("lib/managers/menu/MenuHiddenRenderer")
require("lib/managers/menu/items/MenuItemColumn")
require("lib/managers/menu/items/MenuItemLevel")
require("lib/managers/menu/items/MenuItemChallenge")
require("lib/managers/menu/items/MenuItemKitSlot")
require("lib/managers/menu/items/MenuItemUpgrade")
require("lib/managers/menu/items/MenuItemMultiChoice")
require("lib/managers/menu/items/MenuItemToggle")
require("lib/managers/menu/items/MenuItemChat")
require("lib/managers/menu/items/MenuItemGenerics")
require("lib/managers/menu/items/MenuItemFriend")
require("lib/managers/menu/items/MenuItemCustomizeController")
require("lib/managers/menu/items/MenuItemInput")
require("lib/managers/menu/items/MenuItemTextBox")
require("lib/managers/menu/items/MenuItemDummy")
require("lib/managers/menu/nodes/MenuNodeTable")
require("lib/managers/menu/nodes/MenuNodeServerList")
require("lib/managers/menu/items/MenuItemCrimeSpreeItem")
core:import("CoreEvent")

MenuManager = MenuManager or class(CoreMenuManager.Manager)
MenuCallbackHandler = MenuCallbackHandler or class(CoreMenuCallbackHandler.CallbackHandler)

require("lib/managers/MenuManagerPD2")
require("lib/managers/menu/MenuManagerCrimeSpreeCallbacks")

MenuManager.IS_NORTH_AMERICA = SystemInfo:platform() == Idstring("WIN32") or Application:is_northamerica()
MenuManager.ONLINE_AGE = (SystemInfo:platform() == Idstring("PS3") or SystemInfo:platform() == Idstring("PS4")) and MenuManager.IS_NORTH_AMERICA and 17 or 18

require("lib/managers/MenuManagerDialogs")
require("lib/managers/MenuManagerDebug")

MenuCrimeNetContactChillInitiator = MenuCrimeNetContactChillInitiator or class()

function MenuCrimeNetContactChillInitiator:modify_node(original_node, data)
	local node = original_node

	node:clean_items()

	local params = {
		callback = "_on_chill_change_difficulty",
		name = "difficulty",
		text_id = "menu_lobby_difficulty_title",
		help_id = "menu_diff_help",
		filter = true
	}
	local data_node = {
		{
			value = "normal",
			text_id = "menu_difficulty_normal",
			_meta = "option"
		},
		{
			value = "hard",
			text_id = "menu_difficulty_hard",
			_meta = "option"
		},
		{
			value = "overkill",
			text_id = "menu_difficulty_very_hard",
			_meta = "option"
		},
		{
			value = "overkill_145",
			text_id = "menu_difficulty_overkill",
			_meta = "option"
		},
		{
			value = "easy_wish",
			text_id = "menu_difficulty_easy_wish",
			_meta = "option"
		},
		{
			value = "overkill_290",
			text_id = "menu_difficulty_apocalypse",
			_meta = "option"
		},
		{
			value = "sm_wish",
			text_id = "menu_difficulty_sm_wish",
			_meta = "option"
		},
		{
			value = "EZeasy",
			text_id = "menu_difficulty_EZeasy",
			_meta = "option"
		},
		type = "MenuItemMultiChoice"
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_enabled(true)
	node:add_item(new_item)

	params = {
		callback = "play_chill_combat",
		name = "CustomSafeHouseDefendBtn",
		align = "left",
		text_id = "menu_cn_chill_combat_defend"
	}
	data_node = {}
	new_item = node:create_item(data_node, params)

	new_item:set_enabled(true)
	node:add_item(new_item)

	params = {
		callback = "ignore_chill_combat",
		name = "CustomSafeHouseIgnoreBtn",
		align = "left",
		text_id = "menu_cn_chill_combat_ignore_defend"
	}
	data_node = {}
	new_item = node:create_item(data_node, params)

	new_item:set_enabled(true)
	node:add_item(new_item)

	params = {
		visible_callback = "is_pc_controller",
		name = "back",
		last_item = "true",
		text_id = "menu_back",
		align = "left",
		previous_node = "true"
	}
	data_node = {}
	new_item = node:create_item(data_node, params)

	node:add_item(new_item)
	node:set_default_item_name(self.DEFAULT_ITEM)
	node:select_item(self.DEFAULT_ITEM)

	return node
end