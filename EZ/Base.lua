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
			modworkshop_id = 21061
		}
	})
end