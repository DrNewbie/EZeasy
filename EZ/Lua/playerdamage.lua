Hooks:PostHook(PlayerDamage, "init", "EZ_PlayerDamage_init", function(self, ...)
	if Global.game_settings.difficulty == "EZeasy" then
		self._lives_init = 1
	end
end)