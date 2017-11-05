function Create_unit_start()
    precache_table()
    spawn_start_time = GameRules:GetGameTime()--Give game time
    GameRules:GetGameModeEntity():SetContextThink(DoUniqueString("Create_units"),
    function()
        if GameRules:State_Get() >= DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
            if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
                City_random_production_unit("NeeBee")
                return 60
            else
                return nil
            end
        end
    end ,
    9)
end

function City_random_production_unit(buiding_name)
    local position = unit_number_table[buiding_name]['position']
    local buiding_team_id = unit_number_table[buiding_name]['buiding_team_id']
    local buiding_control = unit_number_table[buiding_name]['buiding_control']
    local unit_number = RandomInt(1,10)
    for key, value in pairs(unit_number_table[buiding_name]) do
        if key ~= 'buiding_team_id' and key ~= 'buiding_control' then
            local max_unit_number = unit_number_table[buiding_name][key]['max']
            local min_unit_number = unit_number_table[buiding_name][key]['min']
            local unit_number = RandomInt(min_unit_number, max_unit_number)
            local unit_name = key
            for i = 0, unit_number, 1 do
                print("baijiege")
                print(key)
                print(position)
                print(buiding_team_id)
                local unit = CreateUnitByName(unit_name,position,false,nil,nil,buiding_team_id)
                unit:AddNewModifier(nil, nil, "modifier_phased", {duration=0.1})
                if unit_number_table[buiding_name]['buiding_control'] ~= nil then 
                    unit:SetControllableByPlayer(buiding_control, true)
                end
            end
        end
    end
end

function precache_table()
    for key, value in pairs(unit_number_table) do
        print(key)
        print(value)
        local entitie = Entities:FindByName(nil, 'upper_left')
        local position = entitie:GetAbsOrigin()--获取各个城池实体往表中充填position
        local buiding = CreateUnitByName(key, position, false, nil, nil, 5)
        unit_number_table[key]['position'] = position
    end
end
