if Global.game_settings.difficulty ~= "EZeasy" then
	return
end

Hooks:PostHook(PlayerDamage, "init", "EZ_PlayerDamage_init", function(self, ...)
	self._lives_init = 1
end)

local EZ_PlayerDamage_Mul = 3

local EZ_PlayerDamage_damage_bullet = PlayerDamage.damage_bullet

function PlayerDamage:damage_bullet(attack_data)
	attack_data.damage = attack_data.damage or 0
	attack_data.damage = attack_data.damage * EZ_PlayerDamage_Mul
	return EZ_PlayerDamage_damage_bullet(self, attack_data)
end

local EZ_PlayerDamage_damage_explosion = PlayerDamage.damage_explosion

function PlayerDamage:damage_explosion(attack_data)
	attack_data.damage = attack_data.damage or 0
	attack_data.damage = attack_data.damage * EZ_PlayerDamage_Mul
	return EZ_PlayerDamage_damage_explosion(self, attack_data)
end

local EZ_PlayerDamage_damage_fire = PlayerDamage.damage_fire

function PlayerDamage:damage_fire(attack_data)
	attack_data.damage = attack_data.damage or 0
	attack_data.damage = attack_data.damage * EZ_PlayerDamage_Mul
	return EZ_PlayerDamage_damage_fire(self, attack_data)
end

local EZ_PlayerDamage_damage_tase = PlayerDamage.damage_tase

function PlayerDamage:damage_tase(attack_data)
	attack_data.damage = attack_data.damage or 0
	attack_data.damage = attack_data.damage * EZ_PlayerDamage_Mul
	return EZ_PlayerDamage_damage_tase(self, attack_data)
end

local EZ_PlayerDamage_damage_melee = PlayerDamage.damage_melee

function PlayerDamage:damage_melee(attack_data)
	attack_data.damage = attack_data.damage or 0
	attack_data.damage = attack_data.damage * EZ_PlayerDamage_Mul
	return EZ_PlayerDamage_damage_melee(self, attack_data)
end