temp_table = {}

function water_slow(trigger)
	local unitname = trigger:GetUnitName()
	if unitname ~= 'sailor' then
		local movespeed = trigger:GetBaseMoveSpeed()
		temp_table[trigger] = movespeed
		trigger:SetBaseMoveSpeed(100)
	end
end

function water_fast(trigger)
	local unitname = trigger:GetUnitName()
	if unitname ~= 'sailor' then
		local movespeed = temp_table[trigger]
		trigger:SetBaseMoveSpeed(movespeed)
	end
end