--Hades
function c37564321.initial_effect(c)
	--Activate(effect)
	local e2=Effect.CreateEffect(c)
	e2:SetCategory(CATEGORY_NEGATE+CATEGORY_DESTROY)
	e2:SetProperty(EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_DAMAGE_CAL)
	e2:SetType(EFFECT_TYPE_ACTIVATE)
	e2:SetCode(EVENT_CHAINING)
	e2:SetCondition(c37564321.condition2)
	e2:SetCountLimit(1,37564321+EFFECT_COUNT_CODE_OATH)
	e2:SetCost(c37564321.cost)
	e2:SetTarget(c37564321.target2)
	e2:SetOperation(c37564321.activate2)
	c:RegisterEffect(e2)
end
function c37564321.cfilter(c)
	return c:IsSetCard(0x776) and c:IsPosition(POS_FACEUP_DEFENSE) and not c:IsStatus(STATUS_BATTLE_DESTROYED)
end
function c37564321.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.CheckReleaseGroup(tp,c37564321.cfilter,1,nil) end
	local g=Duel.SelectReleaseGroup(tp,c37564321.cfilter,1,1,nil)
	Duel.Release(g,REASON_COST)
end
function c37564321.condition2(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsChainNegatable(ev)
end
function c37564321.target2(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetOperationInfo(0,CATEGORY_NEGATE,eg,1,0,0)
	if re:GetHandler():IsDestructable() and re:GetHandler():IsRelateToEffect(re) then
		Duel.SetOperationInfo(0,CATEGORY_DESTROY,eg,1,0,0)
	end
end
function c37564321.activate2(e,tp,eg,ep,ev,re,r,rp)
	Duel.NegateActivation(ev)
	if re:GetHandler():IsRelateToEffect(re) then
		Duel.Destroy(eg,REASON_EFFECT)
	end
end