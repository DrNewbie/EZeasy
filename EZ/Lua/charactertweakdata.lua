Hooks:PostHook(CharacterTweakData, "init", "EZ_CharacterTweakData_init", function(self, ...)
	if Global and Global.game_settings and Global.game_settings.difficulty then
		self._speech_prefix_p2 = (Global.game_settings.difficulty == "sm_wish" or Global.game_settings.difficulty == "EZeasy") and "d" or "n"
	end
end)