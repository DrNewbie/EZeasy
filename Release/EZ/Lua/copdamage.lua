Hooks:PostHook(CopDamage, "init", "EZ_CopDamage_init", function(self)
	if Global.game_settings.difficulty == "EZeasy" then
		self._damage_reduction_multiplier = 0.25
	end
end)