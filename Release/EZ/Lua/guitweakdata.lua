Hooks:PostHook(GuiTweakData, "init", "EZ_GuiTweakData_init", function(self, ...)
	self.blackscreen_risk_textures['EZeasy'] = self.blackscreen_risk_textures['sm_wish']
	for k, v in pairs(self.crime_net.locations) do
		if v.filters and v.filters.difficulties then
			table.insert(self.crime_net.locations[k].filters.difficulties, 'EZeasy')
		end
	end
end)