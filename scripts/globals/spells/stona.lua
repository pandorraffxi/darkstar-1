-----------------------------------------
-- Spell: Stona
-- Removes petrification from target.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    if (target:delStatusEffect(EFFECT_PETRIFICATION)) then
        spell:setMsg(msgBasic.MAGIC_REMOVE_EFFECT);
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end
    return EFFECT_PETRIFICATION;
end;
