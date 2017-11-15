temp_table = {}

function water_slow(trigger)
	print("baijiege1")
	print(trigger.activator)
	print(trigger.caller)
	local unitname = trigger.activator:GetUnitName()
	if unitname ~= 'sailor' then
		local movespeed = trigger:GetBaseMoveSpeed()
		temp_table[trigger] = movespeed
		trigger.activator:SetBaseMoveSpeed(100)
	end
end

function water_fast(trigger)
	local unitname = trigger.activator:GetUnitName()
	if unitname ~= 'sailor' then
		local movespeed = temp_table[trigger]
		trigger.activator:SetBaseMoveSpeed(movespeed)
	end
end