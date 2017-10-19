Hooks:Add("LocalizationManagerPostInit", "EZeasy_loc", function(loc)
	LocalizationManager:add_localized_strings({
		["menu_risk_EZeasy"] = "'EZ'",
		["menu_difficulty_EZeasy"] = "'EZ'"
	})
end)

if UpdateThisMod then
	UpdateThisMod:Add({
		mod_id = 'EZeasy',
		data = {
			modworkshop_id = 0
            dl_url = 'https://github.com/DrNewbie/BotArmorSkins/raw/master/Bot%20Armor%20Skins.zip',
            info_url = 'https://raw.githubusercontent.com/DrNewbie/EZeasy/master/Release/EZ/mod.txt'
        }
	})
end