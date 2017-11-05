require('creat_unit')
require('unit_number_table')

if CAddonTemplateGameMode == nil then
    CAddonTemplateGameMode = class({})
end

function Precache( context )
    --[[
        Precache things we know we'll use.  Possible file types include (but not limited to):
            PrecacheResource( "model", "*.vmdl", context )
            PrecacheResource( "soundfile", "*.vsndevts", context )
            PrecacheResource( "particle", "*.vpcf", context )
            PrecacheResource( "particle_folder", "particles/folder", context )
    ]]
    --Cache the creature models
    PrecacheUnitByNameSync( "npc_dota_creature_basic_zombie", context )
    PrecacheModel( "npc_dota_creature_basic_zombie", context )

    PrecacheResource( "particle", "particles/units/heroes/hero_drow/drow_base_attack.vpcf", context )--小黑投射物
	PrecacheResource( "particle", "particles/econ/courier/courier_gold_horn/courier_gold_horn_ambient_feather.vpcf", context )
	PrecacheResource( "particle", "particles/econ/courier/courier_jadehoof_ambient/jadehoof_special_blossoms.vpcf", context )
    PrecacheResource( "particle", "particles/econ/items/omniknight/hammer_ti6_immortal/omniknight_pu_ti6_heal_hammers.vpcf", context )
    PrecacheResource( "model", "models/items/courier/pw_zombie/pw_zombie.vmdl", context )

    PrecacheResource( "model", "models/events/ti7/teams/teams_liquid_champions.vmdl", context )
    ---NewBee
    PrecacheResource( "particle", "particles/units/heroes/hero_alchemist/alchemist_unstableconc_flyiong_bottl.vpcf", context )
    PrecacheResource( "model", "models/events/ti6/teams/newbee_3dlogo_model.vmdl", context )
    ---A队
    PrecacheResource( "model", "models/events/ti6/teams/team_111474.vmdl", context )
    PrecacheResource( "model", "models/heroes/lich/lich.vmdl", context )
    PrecacheResource( "particle", "particles/world_tower/tower_upgrade/ti7_radiant_tower_lvl11_orb_dark.vpcf", context )
    
    PrecacheResource( "model", "models/creeps/greevil_shopkeeper/greevil_shopkeeper.vmdl", context )
    PrecacheResource( "model", "models/courier/greevil/gold_greevil.vmdl", context )
    PrecacheResource( "model", "models/courier/gold_mega_greevil/gold_mega_greevil.vmdl", context )
    PrecacheResource( "model", "models/courier/greevil/greevil.vmdl", context )
    PrecacheResource( "model", "models/items/courier/vigilante_fox_green/vigilante_fox_green.vmdl", context )
    PrecacheResource( "model", "models/courier/greevil/greevil.vmdl", context )
    PrecacheResource( "model", "models/props_gameplay/pumpkin_bucket.vmdl", context )
    PrecacheResource( "model", "models/props_winter/present.vmdl", context )
    PrecacheResource( "model", "models/props_gameplay/frog.vmdl", context )
    PrecacheResource( "particle", "particles/generic_gameplay/dropped_item.vpcf", context )
    PrecacheResource( "model", "models/heroes/broodmother/broodmother.vmdl", context )
    --Infantry
    PrecacheResource( "model", "models/heroes/dragon_knight/dragon_knight.vmdl", context )
    PrecacheResource( "model", "models/items/dragon_knight/blazingsuperiority_head/blazingsuperiority_head.vmdl", context )
    PrecacheResource( "model", "models/heroes/dragon_knight/shoulders.vmdl", context )
    PrecacheResource( "model", "models/items/dragon_knight/blood_ravager.vmdl", context )
    PrecacheResource( "model", "models/items/dragon_knight/blazingsuperiority_shoulder/blazingsuperiority_shoulder.vmdl", context )
    PrecacheResource( "model", "models/items/dragon_knight/shield_timedragon.vmdl", context )
    PrecacheResource( "model", "models/heroes/dragon_knight/skirt.vmdl", context )
    PrecacheResource( "model", "models/items/dragon_knight/wurmblood_back/wurmblood_back.vmdl", context )
    --Cache sounds for traps
    PrecacheResource( "soundfile", "soundevents/custom_sound_events.vsndevts", context )
end

-- Create the game mode when we activate
function Activate()
    GameRules.AddonTemplate = CAddonTemplateGameMode()
    GameRules.AddonTemplate:InitGameMode()
end

function CAddonTemplateGameMode:InitGameMode()
    print( "Template addon is loaded." )
    local GameModeEntity = GameRules:GetGameModeEntity()
    GameRules:SetHeroRespawnEnabled(false)--关闭默认的英雄复活机制
    GameRules:SetUseUniversalShopMode(true)--全图物品
    GameModeEntity:SetUnseenFogOfWarEnabled(true)--启用战争迷雾
    GameModeEntity:SetStashPurchasingDisabled(false) --关闭储存处购买
    GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 1 )--2
    GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 1 )--3
    GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_1, 1 )--6
    GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_2, 1 )--7
    GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_3, 1 )--8
    GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_4, 1 )--9
    GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_5, 1 )--10
    GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_6, 1 )--11
    GameModeEntity:SetThink( "OnThink", self, "GlobalThink", 2 )
    ListenToGameEvent("game_rules_state_change", Dynamic_Wrap(CAddonTemplateGameMode,"OnGameRulesStateChange"), self)
    --监听单位受到伤害事件
    ListenToGameEvent("entity_hurt", Dynamic_Wrap(CAddonTemplateGameMode, "OnEntityHurt"), self)
    --监听单位被击杀的事件
    ListenToGameEvent("entity_killed", Dynamic_Wrap(CAddonTemplateGameMode, "OnEntityKilled"), self)
    --监听玩家聊天事件
    ListenToGameEvent("player_chat", Dynamic_Wrap(CAddonTemplateGameMode, "PlayerChat"), self)
    --监听单位重生或者创建事件
    ListenToGameEvent("npc_spawned", Dynamic_Wrap(CAddonTemplateGameMode, "OnNPCSpawned"), self)
end

function CAddonTemplateGameMode:OnGameRulesStateChange( keys )
    print("OnGameRulesStateChange")
    DeepPrintTable(keys)    --详细打印传递进来的表
    GameRules:SetPreGameTime( 10.0)  --设置等待游戏开始时间为10秒
    --获取游戏进度
    local newState = GameRules:State_Get()
    if newState == DOTA_GAMERULES_STATE_HERO_SELECTION then
        print("Player begin select hero")  --玩家处于选择英雄界面
        random_tree("upper_left", "lower_right", 0.05, 0.05)
    elseif newState == DOTA_GAMERULES_STATE_PRE_GAME then
        print("Player ready game begin")  --玩家处于游戏准备状态
        --CustomUI:DynamicHud_Create(-1,"bubble","file://{resources}/layout/custom_game/bubble.xml",nil)
    elseif newState == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        print("Player game begin")  --玩家开始游戏
        Create_unit_start()
    end
end

function OnBubble( index,keys )
    print('Onbubble')
    --index 是事件的index值
    --keys 是一个table，固定包含一个触发的PlayerID，其余的是传递过来的数据
    -- CustomUI:DynamicHud_Create(keys.PlayerID,"bubble","file://{resources}/layout/custom_game/bubble.xml",nil)
    CustomGameEventManager:Send_ServerToPlayer( PlayerResource:GetPlayer(keys.PlayerID), "avalon_display_bubble", {text="test"} )
    CustomUI:DynamicHud_Destroy(keys.PlayerID,"bubble")
end

function CAddonTemplateGameMode:OnNPCSpawned( keys )
    print("OnNPCSpawned")
    DeepPrintTable(keys)    --详细打印传递进来的表
    local NPC = EntIndexToHScript(keys.entindex)
    local NPC_name = NPC:GetUnitName()
    local NPC_unit_label = NPC:GetUnitLabel()
    print('unit_label')
    print(NPC_unit_label)
    print(NPC_name)
    if NPC_unit_label == "player_hero" then
        print('unit_label')
        local NPC_team = NPC:GetTeamNumber()
        local pos = NPC:GetAbsOrigin()
        local greevil = 'greevil'..NPC_team 
        print(greevil)
        local follow_greevil = CreateUnitByName(greevil, pos, false, nil, nil, NPC_team)
        follow_greevil:AddNewModifier(nil, nil, "modifier_phased", {duration=0.1})
        GameRules:GetGameModeEntity():SetContextThink(
            DoUniqueString("move_to_npc"),
            function ()
                --follow_greevil:MoveToPosition(vector)
                --follow_greevil:PickupDroppedItem(item handle)
                follow_greevil:MoveToNPC(NPC)
                return 30
            end,
            60
        )
    end
end

function CAddonTemplateGameMode:OnEntityHurt( keys )
    print("OnEntityHurt")
    DeepPrintTable(keys)    --详细打印传递进来的表
    local attacker = EntIndexToHScript(keys.entindex_attacker)
    local killed = EntIndexToHScript(keys.entindex_killed)
end

function CAddonTemplateGameMode:OnEntityKilled( keys )
    print("OnEntityKilled")
    DeepPrintTable(keys)    --详细打印传递进来的表
    local attacker = EntIndexToHScript(keys.entindex_attacker)
    local killed = EntIndexToHScript(keys.entindex_killed)
    local killed_name = killed:GetUnitName()
    local killed_unit_label = killed:GetUnitLabel()
    if killed_unit_label == "Buiding" then
        print("baijiege")
        local killed_name = killed:GetUnitName()
        local pos = killed:GetAbsOrigin()
        local buiding_team = attacker:GetTeamNumber()
        local buiding = CreateUnitByName(killed_name,pos,false,nil,nil,buiding_team)
        buiding:AddNewModifier(nil, nil, "modifier_phased", {duration=0.1})
        print(buding_team)
        print("save nice")
        local player_teamid = attacker:GetMainControllingPlayer()
        buiding:SetControllableByPlayer(player_teamid, true)
        local killed_unit_team = killed:GetTeamNumber()
        unit_number_table[killed_name]['buiding_team_id'] = buiding_team
        unit_number_table[killed_name]['buiding_control'] = player_teamid
        --Create_unit:set_team_and_controler(killed_name, buiding_team, player_teamid)
        if killed_unit_team == 5 then
            local random_number = RandomInt(1,10)
            print('random_number')
            print(random_number)
            if random_number <=5 then
                local item = CreateItem('item_winter_gift1', nil, nil)
                item:SetPurchaseTime(0)
                local drop = CreateItemOnPositionSync( pos, item )
                local pos_launch = pos+RandomVector(RandomFloat(150,200))
                item:LaunchLoot(false, 200, 0.75, pos_launch)
            elseif random_number == 9 then
                local item = CreateItem('item_winter_gift3', nil, nil)
                item:SetPurchaseTime(0)
                local drop = CreateItemOnPositionSync( pos, item )
                local pos_launch = pos+RandomVector(RandomFloat(150,200))
                item:LaunchLoot(false, 200, 0.75, pos_launch)       
            else
                local item = CreateItem('item_winter_gift2', nil, nil)
                item:SetPurchaseTime(0)
                local drop = CreateItemOnPositionSync( pos, item )
                local pos_launch = pos+RandomVector(RandomFloat(150,200))
                item:LaunchLoot(false, 200, 0.75, pos_launch)
            end
        end
    end
end

function CAddonTemplateGameMode:PlayerChat( keys )
    print("PlayerSay")
    DeepPrintTable(keys)    --详细打印传递进来的表
    print(abc)
    --UTIL_MessageText(int playerId, string message, int r, int g, int b, int a) 
end

-- Evaluate the state of the game
function CAddonTemplateGameMode:OnThink()
    if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        --print( "Template addon script is running." )
    elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
        return nil
    end
    return 1
end

function random_tree(upper_left_name, lower_right_name, probability_first, probability_step)
    local upper_left = Entities:FindByName(nil, upper_left_name) --左上实体
    local lower_right = Entities:FindByName(nil, lower_right_name) --右下实体
    print("baijiege")
    local upper_left_coordinate = upper_left:GetAbsOrigin() --Entities自带方法GetAbsOrigin
    local lower_right_coordinate = lower_right:GetAbsOrigin()
    local probability = probability_first
    local array = {}
    --初始化存储有无树木的数组，0为没有树木。大于零表示保存了左边树木的横轴生长概率
    for x = upper_left_coordinate.x-100, lower_right_coordinate.x+100, 100 do --为了防止array[x-100]时index 为nil
        array[x] = {}
        for y = lower_right_coordinate.y, upper_left_coordinate.y, 100 do 
            array[x][y] = 0
        end
    end
    for x = upper_left_coordinate.x, lower_right_coordinate.x, 100 do
        for y = lower_right_coordinate.y, upper_left_coordinate.y, 100 do
            local random = math.random()
            if array[x-100][y] >0 then --判定当前位置左边有无树木
                if probability > 1 then
                    probability = 0.90 --极限概率值为0.99
                end
                probability = probability+probability_step
                if random < array[x-100][y] then
                    array[x][y] = random+probability_step
                    CreateTempTree(Vector(x+100,y), 666)
                    array[x+100][y] = 1 --注意，这里的是临时1单纯只是标志有树，防止重复重叠创造树木
                else
                    array[x][y] = 0
                end
            end
            if probability > 1 then
                probability = 0.90 --极限概率值为0.99
            end
            if random < probability and array[x][y] == 0 then
                CreateTempTree(Vector(x,y), 666)
                array[x][y] = probability --记录当前坐标值为有树木,并记录当前概率值。这样子做的原因是树木是按顺序依照Y轴从上到下生长，要考虑到树木从左边获取生长概率
                --当前位置上方有树木
                probability = probability+probability_step
            else
                probability = probability_first
            end
        end
    end
end