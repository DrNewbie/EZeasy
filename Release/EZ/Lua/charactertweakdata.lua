Hooks:PostHook(CharacterTweakData, "init", "EZ_CharacterTweakData_init", function(self)
	if Global and Global.game_settings and Global.game_settings.difficulty then
		self._speech_prefix_p2 = (Global.game_settings.difficulty == "sm_wish" or Global.game_settings.difficulty == "EZeasy") and "d" or "n"
	end
end)

Hooks:PostHook(CharacterTweakData, "_set_sm_wish", "EZ_CharacterTweakData_set_sm_wish", function(self)
	if Global.game_settings.difficulty == "EZeasy" then
		self:_multiply_all_hp(1000000, 1.5)
		self:_multiply_all_speeds(10, 10)
		self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
		self:_multiply_weapon_delay(self.presets.weapon.good, 0)
		self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
		self:_multiply_weapon_delay(self.presets.weapon.sniper, 0)
		self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	end
end)