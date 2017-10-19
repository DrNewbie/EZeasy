if Global.game_settings.difficulty ~= "EZeasy" then
	return
end

local EZ_TeamAIDamage_Mul = 3

local EZ_TeamAIDamage_damage_bullet = TeamAIDamage.damage_bullet

function TeamAIDamage:damage_bullet(attack_data)
	attack_data.damage = attack_data.damage or 0
	attack_data.damage = attack_data.damage * EZ_TeamAIDamage_Mul
	return EZ_TeamAIDamage_damage_bullet(self, attack_data)
end

local EZ_TeamAIDamage_damage_explosion = TeamAIDamage.damage_explosion

function TeamAIDamage:damage_explosion(attack_data)
	attack_data.damage = attack_data.damage or 0
	attack_data.damage = attack_data.damage * EZ_TeamAIDamage_Mul
	return EZ_TeamAIDamage_damage_explosion(self, attack_data)
end

local EZ_TeamAIDamage_damage_fire = TeamAIDamage.damage_fire

function TeamAIDamage:damage_fire(attack_data)
	attack_data.damage = attack_data.damage or 0
	attack_data.damage = attack_data.damage * EZ_TeamAIDamage_Mul
	return EZ_TeamAIDamage_damage_fire(self, attack_data)
end

local EZ_TeamAIDamage_damage_tase = TeamAIDamage.damage_tase

function TeamAIDamage:damage_tase(attack_data)
	attack_data.damage = attack_data.damage or 0
	attack_data.damage = attack_data.damage * EZ_TeamAIDamage_Mul
	return EZ_TeamAIDamage_damage_tase(self, attack_data)
end

local EZ_TeamAIDamage_damage_melee = TeamAIDamage.damage_melee

function TeamAIDamage:damage_melee(attack_data)
	attack_data.damage = attack_data.damage or 0
	attack_data.damage = attack_data.damage * EZ_TeamAIDamage_Mul
	return EZ_TeamAIDamage_damage_melee(self, attack_data)
end