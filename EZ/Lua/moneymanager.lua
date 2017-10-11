function MoneyManager:get_cost_of_premium_contract(job_id, difficulty_id)
	local job_data = tweak_data.narrative:job_data(job_id)

	if not job_data then
		return 0
	end

	local stars = job_data.jc / 10
	local total_payout, base_payout, risk_payout = self:get_contract_money_by_stars(stars, difficulty_id - 2, #tweak_data.narrative:job_chain(job_id), job_id)
	local diffs = {
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
	local value = total_payout * self:get_tweak_value("money_manager", "buy_premium_multiplier", diffs[difficulty_id]) + self:get_tweak_value("money_manager", "buy_premium_static_fee", diffs[difficulty_id])
	local total_value = value
	local multiplier = 1 * managers.player:upgrade_value("player", "buy_cost_multiplier", 1) * managers.player:upgrade_value("player", "crime_net_deal", 1) * managers.player:upgrade_value("player", "premium_contract_cost_multiplier", 1)
	local _contract_cost = job_data.contract_cost and job_data.contract_cost[difficulty_id - 1] or 0
	total_value = total_value + (_contract_cost / self:get_tweak_value("money_manager", "offshore_rate") or 0)
	total_value = total_value * multiplier

	return total_value
end