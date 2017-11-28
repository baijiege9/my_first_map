require('creat_unit')
require('unit_number_table')
require('water_slow')

if CAddonTemplateGameMode == nil then
    CAddonTemplateGameMode = class({})
end
temp_item_number_table = {}
if greevil_table == nil then
    greevil_table={
    [2] = 0,
    [3] = 0,
    [6] = 0,
    [7] = 0,
    [8] = 0,
    [9] = 0,
    [10] = 0,
    [11] = 0
}
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
    PrecacheResource( "particle", "particles/units/heroes/hero_windrunner/wr_taunt_kiss_heart.vpcf", context )--贪魔爱心特效my master
    
    PrecacheResource( "particle", "particles/units/heroes/hero_bane/bane_projectile_attack_b.vpcf", context )
    PrecacheResource( "particle", "particles/econ/items/crystal_maiden/crystal_maiden_ward_staff/crystal_maiden_ward_staff_model.vpcf", context )
    PrecacheResource( "particle", "particles/econ/items/crystal_maiden/ti7_immortal_shoulder/cm_ti7_immortal_base_attack.vpcf", context )--冰雪投掷物
    PrecacheResource( "model", "models/items/wards/esp_eye_of_thunderkeg/esp_eye_of_thunderkeg.vmdl", context )--Ehome
    PrecacheResource( "model", "models/items/wards/esl_wardchest_woody/esl_wardchest_woody.vmdl", context )--A_team
    PrecacheResource( "model", "models/items/wards/eye_of_lyralei/eye_of_lyralei.vmdl", context )--hellraisers
    PrecacheResource( "model", "models/items/wards/eyeofforesight/eyeofforesight.vmdl", context )--LGD
    PrecacheResource( "model", "models/items/wards/esl_wardchest_living_overgrowth/esl_wardchest_living_overgrowth.vmdl", context )--LGD
    PrecacheResource( "model", "models/items/wards/alliance_ward/alliance_ward.vmdl", context )
    PrecacheResource( "model", "models/items/wards/arcticwatchtower/arcticwatchtower.vmdl", context )--Secret
    PrecacheResource( "model", "models/items/wards/atlas_burden_ward/atlas_burden_ward.vmdl", context )--MVP
    PrecacheResource( "model", "models/items/wards/blood_seeker_ward/bloodseeker_ward.vmdl", context )--IG
    PrecacheResource( "model", "models/items/wards/d2lp_4_ward/d2lp_4_ward.vmdl", context )--IGV
    PrecacheResource( "model", "models/items/wards/the_monkey_sentinel/the_monkey_sentinel.vmdl", context )--wings
    PrecacheResource( "model", "models/items/wards/eye_of_avernus_ward/eye_of_avernus_ward.vmdl", context )--Liquid 
    PrecacheResource( "model", "models/items/wards/esl_one_jagged_vision/esl_one_jagged_vision.vmdl", context )--VGR
    PrecacheResource( "model", "models/items/wards/esl_wardchest_direling_ward/esl_wardchest_direling_ward.vmdl", context )--OG
    PrecacheResource( "model", "models/items/wards/esl_wardchest_four_armed_observer/esl_wardchest_four_armed_observer.vmdl", context )--Escape
    PrecacheResource( "model", "models/items/wards/esl_wardchest_franglerfish_ward/esl_wardchest_franglerfish_ward.vmdl", context )--C9
    PrecacheResource( "model", "models/items/wards/esl_wardchest_rockshell_terrapin/esl_wardchest_rockshell_terrapin.vmdl", context )--COL
    PrecacheResource( "model", "models/items/wards/frozen_formation/frozen_formation.vmdl", context )--EG
    PrecacheResource( "model", "models/items/wards/watcher_below_ward/watcher_below_ward.vmdl", context )--NAVI
    PrecacheResource( "model", "models/items/wards/winged_watcher/winged_watcher.vmdl", context )--DC
    PrecacheResource( "model", "models/items/wards/witchdoctor_ward/witchdoctor_ward.vmdl", context )--VP
    PrecacheResource( "model", "models/items/wards/phoenix_ward/phoenix_ward.vmdl", context )--TNC
    PrecacheResource( "model", "models/items/wards/skywrath_sentinel/skywrath_sentinel.vmdl", context )--LFY
    PrecacheResource( "model", "models/items/wards/sea_dogs_watcher/sea_dogs_watcher.vmdl", context )--Execration

    PrecacheResource( "particle", "particles/econ/courier/courier_gold_horn/courier_gold_horn_ambient_feather.vpcf", context )
    PrecacheResource( "particle", "particles/econ/courier/courier_jadehoof_ambient/jadehoof_special_blossoms.vpcf", context )
    PrecacheResource( "particle", "particles/econ/items/omniknight/hammer_ti6_immortal/omniknight_pu_ti6_heal_hammers.vpcf", context )
    PrecacheResource( "model", "models/items/wards/monty_ward/monty_ward.vmdl", context )

    PrecacheResource( "model", "models/creeps/lane_creeps/creep_radiant_ranged/radiant_ranged_mega.vmdl", context )--金魔法师
    
    PrecacheResource( "model", "models/creeps/lane_creeps/creep_radiant_ranged/radiant_ranged.vmdl", context )--木魔法师

    PrecacheResource( "model", "models/creeps/lane_creeps/creep_bad_ranged/lane_dire_ranged.vmdl", context )--火

    PrecacheResource( "model", "models/creeps/lane_creeps/creep_bad_ranged/lane_dire_ranged_mega.vmdl", context )--土

    PrecacheResource( "model", "models/heroes/nevermore/nevermore.vmdl", context )--水
    PrecacheResource( "particle", "particles/status_fx/status_effect_medusa_stone_gaze.vpcf", context )
    PrecacheResource( "particle", "particles/econ/events/ti7/teleport_start_ti7_spin_water.vpcf", context )
    PrecacheResource( "particle", "particles/dev/library/base_follow_absorigin_instant.vpcf", context  )

    PrecacheResource( "model", "models/heroes/drow/drow.vmdl", context )--black_bowman
    PrecacheResource( "particle", "particles/units/heroes/hero_drow/drow_base_attack.vpcf", context )--小黑投射物
    PrecacheResource( "model", "models/items/drow/trophy_of_the_shadowcat/trophy_of_the_shadowcat.vmdl", context )
    PrecacheResource( "model", "models/items/drow/dotapit_s3_frostfang_bow/dotapit_s3_frostfang_bow.vmdl", context )
    PrecacheResource( "model", "models/items/drow/quiver_of_the_boreal_watch/quiver_of_the_boreal_watch.vmdl", context )
    PrecacheResource( "model", "models/items/drow/boots_of_the_envious_archer/boots_of_the_envious_archer.vmdl", context )
    PrecacheResource( "model", "models/items/drow/black_wind_shoulders/black_wind_shoulders.vmdl", context )
    PrecacheResource( "model", "models/heroes/drow/drow_bracers.vmdl", context )

    PrecacheResource( "model", "models/heroes/kunkka/kunkka.vmdl", context )--sailor 水手
    PrecacheResource( "model", "models/items/kunkka/kunkka_bandana.vmdl", context )
    PrecacheResource( "model", "models/items/kunkka/kunkka_hook.vmdl", context )
    PrecacheResource( "model", "models/items/kunkka/kunkka_pegleg.vmdl", context )
    PrecacheResource( "model", "models/items/kunkka/claddish_shoulder/claddish_shoulder.vmdl", context )
    PrecacheResource( "model", "models/heroes/kunkka/kunkka_sword.vmdl", context )
    
    PrecacheResource( "model", "models/heroes/huskar/huskar.vmdl", context ) --lancer 枪兵
    PrecacheResource( "model", "models/heroes/huskar/huskar_bracer.vmdl", context )
    PrecacheResource( "model", "models/heroes/huskar/huskar_dagger.vmdl", context )
    PrecacheResource( "model", "models/heroes/huskar/huskar_helmet.vmdl", context )
    PrecacheResource( "model", "models/heroes/huskar/huskar_shoulder.vmdl", context )
    PrecacheResource( "model", "models/heroes/huskar/huskar_spear.vmdl", context )
    

    PrecacheResource( "model", "models/heroes/centaur/centaur.vmdl", context )--cavalry
    PrecacheResource( "model", "models/heroes/centaur/shield.vmdl", context )
    PrecacheResource( "model", "models/heroes/centaur/bracer.vmdl", context )
    PrecacheResource( "model", "models/heroes/centaur/tail.vmdl", context )
    PrecacheResource( "model", "models/items/centaur/armor_sleek_1/armor_sleek_1.vmdl", context )
    PrecacheResource( "model", "models/items/centaur/back_sleek_1/back_sleek_1.vmdl", context )
    PrecacheResource( "model", "models/items/centaur/brutal_head_final/brutal_head_final.vmdl", context )
    PrecacheResource( "model", "models/items/centaur/warrior_of_the_steppe_weapon/warrior_of_the_steppe_weapon.vmdl", context )

    PrecacheResource( "model", "models/heroes/windrunner/windrunner.vmdl", context )--light_bowman
    PrecacheResource( "model", "models/items/windrunner/windleafcape/windleafcape.vmdl", context )
    PrecacheResource( "model", "models/items/windrunner/lyraleis_breeze/lyraleis_breeze.vmdl", context )
    PrecacheResource( "model", "models/items/windrunner/quiver_of_the_northern_wind/quiver_of_the_northern_wind.vmdl", context )
    PrecacheResource( "model", "models/items/windrunner/robin_hat/robin_hat.vmdl", context )
    PrecacheResource( "model", "models/heroes/windrunner/windrunner_shoulderpads.vmdl", context )
    PrecacheResource( "particle", "particles/units/heroes/hero_windrunner/windrunner_base_attack.vpcf", context )

    PrecacheResource( "model", "models/creeps/lane_creeps/creep_good_siege/creep_good_siege_new_deathsim_winter.vmdl", context )--Catapult
    PrecacheResource( "particle", "particles/base_attacks/ranged_tower_bad_trail_b.vpcf", context )

    PrecacheResource( "model", "models/events/ti7/teams/teams_liquid_champions.vmdl", context )
    ---NewBee
    PrecacheResource( "particle", "particles/econ/items/bounty_hunter/bounty_hunter_weapon_right_darksteel/bounty_hunter_hand_r_darksteel_b.vpcf", context )
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
    GameModeEntity:SetUnseenFogOfWarEnabled(false)--启用战争迷雾
    GameModeEntity:SetStashPurchasingDisabled(true) --关闭储存处购买
    GameModeEntity:SetBuybackEnabled(false) --禁止买活
    GameRules:SetStartingGold(0)--设置初始金钱为0
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
    CustomGameEventManager:RegisterListener( "test", OnBubble )
end

function CAddonTemplateGameMode:OnGameRulesStateChange( keys )
    print("OnGameRulesStateChange")
    DeepPrintTable(keys)    --详细打印传递进来的表
    GameRules:SetPreGameTime( 10.0)  --设置等待游戏开始时间为10秒
    --获取游戏进度
    local newState = GameRules:State_Get()
    if newState == DOTA_GAMERULES_STATE_HERO_SELECTION then
        print("Player begin select hero")  --玩家处于选择英雄界面
        random_tree("upper_left", "lower_right", 0.01, 0.01)
    elseif newState == DOTA_GAMERULES_STATE_PRE_GAME then
        print("Player ready game begin")  --玩家处于游戏准备状态
       -- CustomUI:DynamicHud_Create(-1,"bubble","file://{resources}/layout/custom_game/bubble.xml",nil)
    elseif newState == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        print("Player game begin")  --玩家开始游戏
        Create_unit_start()
    end
end

function CAddonTemplateGameMode:OnNPCSpawned( keys )
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
        temp_item_number_table[NPC_team] = 0
        follow_greevil:AddNewModifier(nil, nil, "modifier_phased", {duration=0.1})
        GameRules:GetGameModeEntity():SetContextThink(
            DoUniqueString("move_to_npc"),
            function ()
                if follow_greevil == nil then
                    return false
                end
                --follow_greevil:MoveToPosition(vector)
                --follow_greevil:PickupDroppedItem(item handle)
                follow_greevil:MoveToNPC(NPC)
                if NPC:GetNumItemsInInventory()==9 then
                    GameRules:SetCustomVictoryMessage(NPC_team.."Team Win")
                    GameRules:SetCustomVictoryMessageDuration(9)
                    GameRules:SetGameWinner(NPC_team)
                elseif NPC:GetNumItemsInInventory()>temp_item_number_table[NPC_team] then
                    temp_item_number_table[NPC_team] = NPC:GetNumItemsInInventory()
                    local text = NPC_team.."Team have gift:"..temp_item_number_table[NPC_team]
                    GameRules:SendCustomMessage(text,NPC_team,1)
                end
                print('fewfwe')
                local number = NPC:GetNumItemsInInventory()
                print(number)
                print(NPC_team)
                return 30
            end,
            5
        )
        local buiding_control = NPC:GetMainControllingPlayer()
        greevil_table[greevil] = follow_greevil
        GameRules:SendCustomMessage('Your team is'..NPC_team,NPC_team,1)
        GameRules:SendCustomMessage('你的队伍编号是'..NPC_team,NPC_team,1)
    end
end

function CAddonTemplateGameMode:OnEntityHurt( keys )
    local attacker = EntIndexToHScript(keys.entindex_attacker)
    local killed = EntIndexToHScript(keys.entindex_killed)
end

function CAddonTemplateGameMode:OnEntityKilled( keys )
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
        local flag = unit_number_table[killed_name]['flag']
        --Create_unit:set_team_and_controler(killed_name, buiding_team, player_teamid)
        if flag == 0 then
            unit_number_table[killed_name]['flag'] = 1
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
    elseif killed_unit_label == "player_hero" then
        local killed_team = killed:GetTeamNumber()
        local position = killed:GetAbsOrigin()
        print('baijiegedfe')
        local unit = greevil_table["greevil"..killed_team]
        if unit:HasAbility('follow_human') then
            unit:RemoveAbility('follow_human')
        end
        if unit:HasModifier("modifier_follow_human") then
            unit:RemoveModifierByName("modifier_follow_human")
        end
        local text = '<font color="while">The G fat:Team'..killed_team..'is loseed<br/>G胖说刚刚那个编号的队伍失败了。<br/> G  толстый  сказал  только, что  команда  не  номер </font> '
        GameRules:SendCustomMessage(text,0,1)
        GameRules:SendCustomMessage('<font color="white">你的贪魔：My master，goodbye, 我永远爱你</font>',killed_team,1)
    end
end

function CAddonTemplateGameMode:PlayerChat( keys )
    print("PlayerSay")
    DeepPrintTable(keys)    --详细打印传递进来的表
    if keys.teamonly == 1 then
        GameRules:SendCustomMessage('<font color="white">greevil: My master, I love you.</font>',keys.playerid,1)
    end
    if keys.text == "我爱你" then
        GameRules:SendCustomMessage('<font color="white">贪魔：我的主人，我爱你</font>',keys.playerid,1)
    elseif keys.text == "你好" then
        GameRules:SendCustomMessage('<font color="white">贪魔：我会一辈子跟随你</font>',keys.playerid,1)
    elseif keys.text == "I love you" then
        GameRules:SendCustomMessage('<font color="white">greevil:Love Love Love.</font>',keys.playerid,1)
    elseif keys.text == "Hi" then
        GameRules:SendCustomMessage('<font color="white">greevil:My master, I will follow you forever.</font>',keys.playerid,1)
    end
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