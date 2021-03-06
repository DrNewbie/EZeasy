tweak_data.difficulties = {
	"easy",
	"normal",
	"hard",
	"overkill",
	"overkill_145",
	"easy_wish",
	"overkill_290",
	"sm_wish",
	"EZeasy"
}
tweak_data.difficulty_level_locks = {
	0,
	0,
	0,
	0,
	0,
	0,
	80,
	80,
	80
}
tweak_data.difficulty_name_ids.EZeasy = "menu_difficulty_EZeasy"

function TweakData:set_difficulty()
	if not Global.game_settings then
		return
	end
	if Global.game_settings.difficulty == "easy" then
		self:_set_easy()
	elseif Global.game_settings.difficulty == "normal" then
		self:_set_normal()
	elseif Global.game_settings.difficulty == "overkill" then
		self:_set_overkill()
	elseif Global.game_settings.difficulty == "overkill_145" then
		self:_set_overkill_145()
	elseif Global.game_settings.difficulty == "easy_wish" then
		self:_set_easy_wish()
	elseif Global.game_settings.difficulty == "overkill_290" then
		self:_set_overkill_290()
	elseif Global.game_settings.difficulty == "sm_wish" then
		self:_set_sm_wish()
	elseif Global.game_settings.difficulty == "EZeasy" then
		self:_set_EZeasy()
	else
		self:_set_hard()
	end
end

function TweakData:_set_EZeasy()
	self:_set_sm_wish()
	self.difficulty_name_id = self.difficulty_name_ids.EZeasy
end

tweak_data:set_difficulty()
tweak_data:set_mode()
tweak_data:digest_tweak_data()