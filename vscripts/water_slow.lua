function OnStartTouch(trigger)
	print('baijiege9')
	print(trigger.activator)
	print(trigger.caller)
	if trigger.activator ~= nil then
		local unitname = trigger.activator:GetUnitName()
		if unitname ~= 'sailor' then
			local ability = trigger.activator:AddAbility("slow_water")
			ability:OnUpgrade()
		end
	end
end

function OnEndTouch(trigger)
	if trigger.activator ~= nil then
		if trigger.activator:HasAbility("slow_water") then
			trigger.activator:RemoveAbility("slow_water")
			trigger.activator:RemoveModifierByName("modifier_slow_water")
		end
	end
end

function  OnStartTheEightDiagrams1(trigger)
	if trigger.activator ~= nil then
		local temp_table = {
			[1] = "TheEightDiagrams2",
			[2] = "TheEightDiagrams5",
			[3] = "TheEightDiagrams1",
			[4] = "TheEightDiagrams8",
			[5] = "TheEightDiagrams6",
			[6] = "TheEightDiagrams4",
			[7] = "TheEightDiagrams7",
			[8] = "TheEightDiagrams3"
		}
		local man = trigger.activator
		local now = GameRules:GetGameTime()
		
		local math1 = now/120
		local math2 = (math1 - math1%1)%8
		
		local ability = trigger.activator:AddAbility(temp_table[math2 + 1])
		
		ability:OnUpgrade()
	end
end

function  OnEndTheEightDiagrams1(trigger)
	if trigger.activator ~= nil then
		local temp_table = {
			[1] = "TheEightDiagrams2",
			[2] = "TheEightDiagrams5",
			[3] = "TheEightDiagrams1",
			[4] = "TheEightDiagrams8",
			[5] = "TheEightDiagrams6",
			[6] = "TheEightDiagrams4",
			[7] = "TheEightDiagrams7",
			[8] = "TheEightDiagrams3"
		}
		local man = trigger.activator
		local now = GameRules:GetGameTime()
		
		local math1 = now/120
		local math2 = (math1 - math1%1)%8
		
		for i = 1, 8 do
			if trigger.activator:HasAbility(temp_table[i]) then
				trigger.activator:RemoveAbility(temp_table[i])
			end
			if trigger.activator:HasModifier("modifier_"..temp_table[i]) then
				trigger.activator:RemoveModifierByName("modifier_"..temp_table[i])
			end
		end
	end
end

function OnStartTheEightDiagrams2(trigger)
	if trigger.activator ~= nil then
		local temp_table = {
			[1] = "TheEightDiagrams5",
			[2] = "TheEightDiagrams1",
			[3] = "TheEightDiagrams8",
			[4] = "TheEightDiagrams6",
			[5] = "TheEightDiagrams4",
			[6] = "TheEightDiagrams7",
			[7] = "TheEightDiagrams3",
			[8] = "TheEightDiagrams2"
		}
		local man = trigger.activator
		local now = GameRules:GetGameTime()
		
		local math1 = now/120
		local math2 = (math1 - math1%1)%8
		
		local ability = trigger.activator:AddAbility(temp_table[math2 + 1])
		
		ability:OnUpgrade()
	end
end

function  OnEndTheEightDiagrams2(trigger)
	if trigger.activator ~= nil then
		local temp_table = {
			[1] = "TheEightDiagrams5",
			[2] = "TheEightDiagrams1",
			[3] = "TheEightDiagrams8",
			[4] = "TheEightDiagrams6",
			[5] = "TheEightDiagrams4",
			[6] = "TheEightDiagrams7",
			[7] = "TheEightDiagrams3",
			[8] = "TheEightDiagrams2"
		}
		local man = trigger.activator
		local now = GameRules:GetGameTime()
		
		local math1 = now/120
		local math2 = (math1 - math1%1)%8
		
		for i = 1, 8 do
			if trigger.activator:HasAbility(temp_table[i]) then
				trigger.activator:RemoveAbility(temp_table[i])
			end
			if trigger.activator:HasModifier("modifier_"..temp_table[i]) then
				trigger.activator:RemoveModifierByName("modifier_"..temp_table[i])
			end
		end
	end
end

function OnStartTheEightDiagrams3(trigger)
	if trigger.activator:GetUnitLabel() ~= "Buiding" then 
		if trigger.activator ~= nil then
			local temp_table = {
				[1] = "TheEightDiagrams1",
				[2] = "TheEightDiagrams8",
				[3] = "TheEightDiagrams6",
				[4] = "TheEightDiagrams4",
				[5] = "TheEightDiagrams7",
				[6] = "TheEightDiagrams3",
				[7] = "TheEightDiagrams2",
				[8] = "TheEightDiagrams5"
			}
			local man = trigger.activator
			local now = GameRules:GetGameTime()
			local math1 = now/120
			local math2 = (math1 - math1%1)%8
			local ability = trigger.activator:AddAbility(temp_table[math2 + 1])
			
			ability:OnUpgrade()
		end
	end
end

function  OnEndTheEightDiagrams3(trigger)
	if trigger.activator ~= nil then
		local temp_table = {
			[1] = "TheEightDiagrams1",
			[2] = "TheEightDiagrams8",
			[3] = "TheEightDiagrams6",
			[4] = "TheEightDiagrams4",
			[5] = "TheEightDiagrams7",
			[6] = "TheEightDiagrams3",
			[7] = "TheEightDiagrams2",
			[8] = "TheEightDiagrams5"
		}
		local man = trigger.activator
		local now = GameRules:GetGameTime()
		
		local math1 = now/120
		local math2 = (math1 - math1%1)%8
		
		for i = 1, 8 do
			if trigger.activator:HasAbility(temp_table[i]) then
				trigger.activator:RemoveAbility(temp_table[i])
			end
			if trigger.activator:HasModifier("modifier_"..temp_table[i]) then
				trigger.activator:RemoveModifierByName("modifier_"..temp_table[i])
			end
		end
	end
end

function OnStartTheEightDiagrams4(trigger)
	if trigger.activator ~= nil then
		local temp_table = {
			[1] = "TheEightDiagrams8",
			[2] = "TheEightDiagrams6",
			[3] = "TheEightDiagrams4",
			[4] = "TheEightDiagrams7",
			[5] = "TheEightDiagrams3",
			[6] = "TheEightDiagrams2",
			[7] = "TheEightDiagrams5",
			[8] = "TheEightDiagrams1"
		}
		local man = trigger.activator
		local now = GameRules:GetGameTime()
		
		local math1 = now/120
		local math2 = (math1 - math1%1)%8
		
		local ability = trigger.activator:AddAbility(temp_table[math2 + 1])
		
		ability:OnUpgrade()
	end
end

function  OnEndTheEightDiagrams4(trigger)
	if trigger.activator ~= nil then
		local temp_table = {
			[1] = "TheEightDiagrams8",
			[2] = "TheEightDiagrams6",
			[3] = "TheEightDiagrams4",
			[4] = "TheEightDiagrams7",
			[5] = "TheEightDiagrams3",
			[6] = "TheEightDiagrams2",
			[7] = "TheEightDiagrams5",
			[8] = "TheEightDiagrams1"
		}
		local man = trigger.activator
		local now = GameRules:GetGameTime()
		
		local math1 = now/120
		local math2 = (math1 - math1%1)%8
		
		for i = 1, 8 do
			if trigger.activator:HasAbility(temp_table[i]) then
				trigger.activator:RemoveAbility(temp_table[i])
			end
			if trigger.activator:HasModifier("modifier_"..temp_table[i]) then
				trigger.activator:RemoveModifierByName("modifier_"..temp_table[i])
			end
		end
	end
end

function OnStartTheEightDiagrams5(trigger)
	if trigger.activator ~= nil then
		local temp_table = {
			[1] = "TheEightDiagrams6",
			[2] = "TheEightDiagrams4",
			[3] = "TheEightDiagrams7",
			[4] = "TheEightDiagrams3",
			[5] = "TheEightDiagrams2",
			[6] = "TheEightDiagrams5",
			[7] = "TheEightDiagrams1",
			[8] = "TheEightDiagrams8"
		}
		local man = trigger.activator
		local now = GameRules:GetGameTime()
		
		local math1 = now/120
		local math2 = (math1 - math1%1)%8
		
		local ability = trigger.activator:AddAbility(temp_table[math2 + 1])
		
		ability:OnUpgrade()
	end
end

function  OnEndTheEightDiagrams5(trigger)
	if trigger.activator ~= nil then
		local temp_table = {
			[1] = "TheEightDiagrams6",
			[2] = "TheEightDiagrams4",
			[3] = "TheEightDiagrams7",
			[4] = "TheEightDiagrams3",
			[5] = "TheEightDiagrams2",
			[6] = "TheEightDiagrams5",
			[7] = "TheEightDiagrams1",
			[8] = "TheEightDiagrams8"
		}
		local man = trigger.activator
		local now = GameRules:GetGameTime()
		
		local math1 = now/120
		local math2 = (math1 - math1%1)%8
		
		for i = 1, 8 do
			if trigger.activator:HasAbility(temp_table[i]) then
				trigger.activator:RemoveAbility(temp_table[i])
			end
			if trigger.activator:HasModifier("modifier_"..temp_table[i]) then
				trigger.activator:RemoveModifierByName("modifier_"..temp_table[i])
			end
		end
	end
end

function OnStartTheEightDiagrams6(trigger)
	if trigger.activator ~= nil then
		local temp_table = {
			[1] = "TheEightDiagrams4",
			[2] = "TheEightDiagrams7",
			[3] = "TheEightDiagrams3",
			[4] = "TheEightDiagrams2",
			[5] = "TheEightDiagrams5",
			[6] = "TheEightDiagrams1",
			[7] = "TheEightDiagrams8",
			[8] = "TheEightDiagrams6"
		}
		local man = trigger.activator
		local now = GameRules:GetGameTime()
		
		local math1 = now/120
		local math2 = (math1 - math1%1)%8
		
		local ability = trigger.activator:AddAbility(temp_table[math2 + 1])
		
		ability:OnUpgrade()
	end
end

function  OnEndTheEightDiagrams6(trigger)
	if trigger.activator ~= nil then
		local temp_table = {
			[1] = "TheEightDiagrams4",
			[2] = "TheEightDiagrams7",
			[3] = "TheEightDiagrams3",
			[4] = "TheEightDiagrams2",
			[5] = "TheEightDiagrams5",
			[6] = "TheEightDiagrams1",
			[7] = "TheEightDiagrams8",
			[8] = "TheEightDiagrams6"
		}
		local man = trigger.activator
		local now = GameRules:GetGameTime()
		
		local math1 = now/120
		local math2 = (math1 - math1%1)%8
		
		for i = 1, 8 do
			if trigger.activator:HasAbility(temp_table[i]) then
				trigger.activator:RemoveAbility(temp_table[i])
			end
			if trigger.activator:HasModifier("modifier_"..temp_table[i]) then
				trigger.activator:RemoveModifierByName("modifier_"..temp_table[i])
			end
		end
	end
end

function OnStartTheEightDiagrams7(trigger)
	if trigger.activator:GetUnitLabel() ~= "Buiding" then 
		if trigger.activator ~= nil then
			local temp_table = {
				[1] = "TheEightDiagrams7",
				[2] = "TheEightDiagrams3",
				[3] = "TheEightDiagrams2",
				[4] = "TheEightDiagrams5",
				[5] = "TheEightDiagrams1",
				[6] = "TheEightDiagrams8",
				[7] = "TheEightDiagrams6",
				[8] = "TheEightDiagrams4"
			}
			local man = trigger.activator
			local now = GameRules:GetGameTime()
			
			local math1 = now/120
			local math2 = (math1 - math1%1)%8
			
			local ability = trigger.activator:AddAbility(temp_table[math2 + 1])
			
			ability:OnUpgrade()
		end
	end
end

function  OnEndTheEightDiagrams7(trigger)
	if trigger.activator ~= nil then
		local temp_table = {
			[1] = "TheEightDiagrams7",
			[2] = "TheEightDiagrams3",
			[3] = "TheEightDiagrams2",
			[4] = "TheEightDiagrams5",
			[5] = "TheEightDiagrams1",
			[6] = "TheEightDiagrams8",
			[7] = "TheEightDiagrams6",
			[8] = "TheEightDiagrams4"
		}
		local man = trigger.activator
		local now = GameRules:GetGameTime()
		
		local math1 = now/120
		local math2 = (math1 - math1%1)%8
		
		for i = 1, 8 do
			if trigger.activator:HasAbility(temp_table[i]) then
				trigger.activator:RemoveAbility(temp_table[i])
			end
			if trigger.activator:HasModifier("modifier_"..temp_table[i]) then
				trigger.activator:RemoveModifierByName("modifier_"..temp_table[i])
			end
		end
	end
end

function OnStartTheEightDiagrams8 (trigger)
	if trigger.activator ~= nil then
		local temp_table = {
			[1] = "TheEightDiagrams3",
			[2] = "TheEightDiagrams2",
			[3] = "TheEightDiagrams5",
			[4] = "TheEightDiagrams1",
			[5] = "TheEightDiagrams8",
			[6] = "TheEightDiagrams6",
			[7] = "TheEightDiagrams4",
			[8] = "TheEightDiagrams7"
		}
		local man = trigger.activator
		local now = GameRules:GetGameTime()
		
		local math1 = now/120
		local math2 = (math1 - math1%1)%8
		
		local ability = trigger.activator:AddAbility(temp_table[math2 + 1])
		
		ability:OnUpgrade()
	end
end

function  OnEndTheEightDiagrams8(trigger)
	if trigger.activator ~= nil then
		local temp_table = {
			[1] = "TheEightDiagrams3",
			[2] = "TheEightDiagrams2",
			[3] = "TheEightDiagrams5",
			[4] = "TheEightDiagrams1",
			[5] = "TheEightDiagrams8",
			[6] = "TheEightDiagrams6",
			[7] = "TheEightDiagrams4",
			[8] = "TheEightDiagrams7"
		}
		local man = trigger.activator
		local now = GameRules:GetGameTime()
		
		local math1 = now/120
		local math2 = (math1 - math1%1)%8
		
		for i = 1, 8 do
			if trigger.activator:HasAbility(temp_table[i]) then
				trigger.activator:RemoveAbility(temp_table[i])
			end
			if trigger.activator:HasModifier("modifier_"..temp_table[i]) then
				trigger.activator:RemoveModifierByName("modifier_"..temp_table[i])
			end
		end
	end
end