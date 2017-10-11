function EZeasy_TweakData_Init()
	local _size = 7
	for heist, _ in pairs(tweak_data.narrative.jobs) do
		tweak_data.narrative.jobs[heist].payout[_size+1] = tweak_data.narrative.jobs[heist].payout[_size] or 0
		tweak_data.narrative.jobs[heist].contract_cost[_size+1] = tweak_data.narrative.jobs[heist].contract_cost[_size] or 0
		tweak_data.narrative.jobs[heist].contract_visuals.min_mission_xp[_size+1] = tweak_data.narrative.jobs[heist].contract_visuals.min_mission_xp[_size] or 0
		tweak_data.narrative.jobs[heist].contract_visuals.max_mission_xp[_size+1] = tweak_data.narrative.jobs[heist].contract_visuals.max_mission_xp[_size] or 0
	end
end

EZeasy_TweakData_Init()