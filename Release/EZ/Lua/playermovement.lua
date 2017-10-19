Hooks:PostHook(PlayerMovement, "on_suspicion", "EZ_PlayerMovement_on_suspicion", function(self, observer_unit, status)
	if type(self._suspicion_ratio) == 'number' then
		
	end
	log('status: ' .. tostring(status))
end)