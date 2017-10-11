Hooks:PostHook(MissionManager, "init", "MissionManagerinit_EZ", function(...)
	if PackageManager:package_exists("packages/sm_wish") and not PackageManager:loaded("packages/sm_wish") then
		PackageManager:load("packages/sm_wish")
	end
end)