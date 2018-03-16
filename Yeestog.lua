-----------------------------------
-- Area: Chocobo_Circuit
--  NPC: NPC Name
-- Sheep Love Favor
-----------------------------------

package.loaded["scripts/zones/Chocobo_Circuit/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
-----------------------------------



function onTrade(player, npc, trade)
    
end;

function onTrigger(player, npc)
    local SL_FAVOR = player:getVar("Sheeplove_Favor")
    local SL_TIMER = (player:getVar("Sheeplove_Favor") - os.time())
    local hrLeft = math.floor(SL_TIMER / 3600);
    local mnLeft = math.floor((SL_TIMER % 3600) / 60);
    SL_Lucky = math.random(1,100) 
    
    if os.time() > SL_FAVOR then
        if math.random(1,100) > 99 then --set to % you want for luck
            player:PrintToPlayer("Lucky!!!!!!", 15) --Will give 60 min for Prot/Shell, 2 tick on regen/refresh. Update dialogue as needed
            
            -- Removes regen if on player
            player:delStatusEffect(EFFECT_REGEN);
            -- Adds regen
            player:addStatusEffect(EFFECT_REGEN,2,3,3600);
            
            -- Removes refresh if on player
            player:delStatusEffect(EFFECT_REFRESH);
            player:delStatusEffect(EFFECT_SUBLIMATION_COMPLETE);
            player:delStatusEffect(EFFECT_SUBLIMATION_ACTIVATED);
            -- Add refresh
            player:addStatusEffect(EFFECT_REFRESH,2,3,3600, 0, 3);
            
            -- Removes protect if on player
            player:delStatusEffect(EFFECT_PROTECT);
            -- Work out how much def to give (highest tier dependent on level)
            local def = 0;
                if (player:getMainLvl()<27) then -- Before protect 2, give protect 1
                    def = 15;
                elseif (player:getMainLvl()<47) then -- After p2, before p3
                    def = 40;
                elseif (player:getMainLvl()<63) then -- After p3, before p4
                    def = 75;
                else -- After p4
                    def = 120;
                end
            -- Add protect
            player:addStatusEffect(EFFECT_PROTECT,def,0,3600);
            
            -- Removes shell if on player
            player:delStatusEffect(EFFECT_SHELL);
            -- Work out how much mdef to give (highest tier dependent on level)
            -- values taken from Shell scripts by Tenjou.
            local def = 0;
                if (player:getMainLvl()<37) then -- Before shell 2, give shell 1
                    def = 24;
                elseif (player:getMainLvl()<57) then -- After s2, before s3
                    def = 36;
                elseif (player:getMainLvl()<68) then -- After s3, before s4
                    def = 48;
                else -- After s4
                    def = 56;
                end
            -- Add shell
            player:addStatusEffect(EFFECT_SHELL,def,0,3600);
            player:setVar("Sheeplove_Favor",os.time() + 14400);
        
        else 
            player:PrintToPlayer("Please enjoy your new sheeplove! You can get this once every 4 hours!", 15) --change dialogue to your liking
            
            -- Removes regen if on player
            player:delStatusEffect(EFFECT_REGEN);
            -- Adds regen
            player:addStatusEffect(EFFECT_REGEN,1,3,3600);
            
            -- Removes refresh if on player
            player:delStatusEffect(EFFECT_REFRESH);
            player:delStatusEffect(EFFECT_SUBLIMATION_COMPLETE);
            player:delStatusEffect(EFFECT_SUBLIMATION_ACTIVATED);
            -- Add refresh
            player:addStatusEffect(EFFECT_REFRESH,1,3,3600, 0, 3);
                
            -- Removes protect if on player
            player:delStatusEffect(EFFECT_PROTECT);
            -- Work out how much def to give (highest tier dependent on level)
            local def = 0;
                if (player:getMainLvl()<27) then -- Before protect 2, give protect 1
                    def = 15;
                elseif (player:getMainLvl()<47) then -- After p2, before p3
                    def = 40;
                elseif (player:getMainLvl()<63) then -- After p3, before p4
                    def = 75;
                else -- After p4
                    def = 120;
                end
            -- Add protect
            player:addStatusEffect(EFFECT_PROTECT,def,0,1800);
            
            -- Removes shell if on player
            player:delStatusEffect(EFFECT_SHELL);
            -- Work out how much mdef to give (highest tier dependent on level)
            -- values taken from Shell scripts by Tenjou.
            local def = 0;
                if (player:getMainLvl()<37) then -- Before shell 2, give shell 1
                    def = 24;
                elseif (player:getMainLvl()<57) then -- After s2, before s3
                    def = 36;
                elseif (player:getMainLvl()<68) then -- After s3, before s4
                    def = 48;
                else -- After s4
                    def = 56;
                end
            -- Add shell
            player:addStatusEffect(EFFECT_SHELL,def,0,1800);
            player:setVar("Sheeplove_Favor",os.time() + 14400);
        end;
            
    else
        player:PrintToPlayer( string.format("Sorry, you will need to wait another %d hours and %d minutes.", hrLeft, mnLeft), 15); -- change dialogue to your liking
    end;
end;


function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player, csid, option)
  
end;
