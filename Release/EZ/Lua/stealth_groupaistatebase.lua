if Global.game_settings.difficulty ~= "EZeasy" then
	return
end

Hooks:PostHook(GroupAIStateBase, "on_criminal_suspicion_progress", "EZ_GroupAIStateBase_on_criminal_suspicion_progress", function(self, u_suspect, u_observer, status)
	if type(status) == 'number' and status < 1 then
		self:on_police_called("alarm_pager_hang_up")
	end
end)

tweak_data.player.alarm_pager.bluff_success_chance = {0}
tweak_data.player.alarm_pager.bluff_success_chance_w_skill = {0}