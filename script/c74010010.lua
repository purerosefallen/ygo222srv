--笨蛋冰精琪露诺
function c74010010.initial_effect(c)
	c:SetUniqueOnField(1,0,74010010)
	c:EnableReviveLimit()
	--disable spsummon
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_CANNOT_SPECIAL_SUMMON)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e1:SetTargetRange(1,1)
	e1:SetTarget(c74010010.sumlimit)
	c:RegisterEffect(e1)
	--atk/def
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_SINGLE)
	e3:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e3:SetRange(LOCATION_MZONE)
	e3:SetCode(EFFECT_UPDATE_ATTACK)
	e3:SetValue(900)
	e3:SetCondition(c74010010.effcon)
	e3:SetLabel(2)
	c:RegisterEffect(e3)
	local e4=e3:Clone()
	e4:SetCode(EFFECT_UPDATE_DEFENSE)
	c:RegisterEffect(e4)
	local e5=Effect.CreateEffect(c)
	e5:SetType(EFFECT_TYPE_SINGLE)
	e5:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e5:SetRange(LOCATION_MZONE)
	e5:SetCode(EFFECT_IMMUNE_EFFECT)
	e5:SetCondition(c74010010.effcon)
	e5:SetLabel(4)
	e5:SetValue(c74010010.efilter)
	c:RegisterEffect(e5)
	--boost
	local e6=Effect.CreateEffect(c)
	e6:SetType(EFFECT_TYPE_FIELD)
	e6:SetCode(EFFECT_UPDATE_ATTACK)
	e6:SetRange(LOCATION_MZONE)
	e6:SetTargetRange(LOCATION_MZONE,0)
	e6:SetCondition(c74010010.effcon)
	e6:SetLabel(6)
	e6:SetTarget(c74010010.atktg)
	e6:SetValue(900)
	c:RegisterEffect(e6)
	local e7=e6:Clone()
	e7:SetCode(EFFECT_UPDATE_DEFENSE)
	c:RegisterEffect(e7)
	local e8=Effect.CreateEffect(c)
	e8:SetType(EFFECT_TYPE_FIELD)
	e8:SetRange(LOCATION_MZONE)
	e8:SetCode(EFFECT_IMMUNE_EFFECT)
	e8:SetTargetRange(LOCATION_MZONE,0)
	e8:SetCondition(c74010010.effcon)
	e8:SetLabel(6)
	e8:SetTarget(c74010010.atktg)
	e8:SetValue(c74010010.efilter)
	c:RegisterEffect(e8)
end
function c74010010.sumlimit(e,c,sump,sumtype,sumpos,targetp)
	return c:IsLevelAbove(10) or c:IsRankAbove(10)
end
function c74010010.filter(c)
	return c:IsSetCard(0x3740)
end
function c74010010.effcon(e,tp,eg,ep,ev,re,r,rp)
    local g=Duel.GetMatchingGroup(c74010010.filter,tp,LOCATION_GRAVE,0,nil)
	local ct=g:GetClassCount(Card.GetCode)
	return ct>=e:GetLabel()
end
function c74010010.efilter(e,te)
	return te:GetOwnerPlayer()~=e:GetHandlerPlayer() and te:IsActiveType(TYPE_MONSTER)
end
function c74010010.atktg(e,c)
	return c:IsSetCard(0x3740) and c~=e:GetHandler()
end