function the_city_was_captured(keys)
	for i, v in pairs(keys) do
		print(tostring(i).."="..tostring(v))
	end
	local caster = keys.caster
	local attacker = keys.attacker
	local attacker_playerID = attacker.GetPlayerOwnerID()
	caster.SetControllableByPlayer(attacker_playerID, false)
end