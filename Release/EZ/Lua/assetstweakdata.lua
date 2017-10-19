Hooks:PostHook(AssetsTweakData, "init", "EZ_GuiTweakData_init_risk_assets", function(self, ...)
	self.risk_EZeasy = {
		name_id = "menu_asset_risklevel_7",
		texture = "guis/textures/pd2/mission_briefing/assets/assets_risklevel_6",
		stages = "all",
		exclude_stages = {
			"safehouse",
			"chill",
			"crojob1",
			"haunted",
			"cage",
			"kosugi",
			"dark",
			"mad",
			"fish"
		},
		risk_lock = 7
	}
end)