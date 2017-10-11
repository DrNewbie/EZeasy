Hooks:PostHook(MoneyTweakData, "init", "EZ_MoneyTweakData_init", function(self, ...)
	self.buy_premium_multiplier.EZeasy = 0
	self.buy_premium_static_fee.EZeasy = 0
end)