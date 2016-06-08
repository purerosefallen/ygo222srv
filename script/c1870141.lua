--女神
function c1870141.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_TOHAND+CATEGORY_SEARCH)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCountLimit(1,1870141+EFFECT_COUNT_CODE_OATH)
	e1:SetCost(c1870141.cost)
	e1:SetTarget(c1870141.target)
	e1:SetOperation(c1870141.activate)
	c:RegisterEffect(e1)
	Duel.AddCustomActivityCounter(1870141,ACTIVITY_SPSUMMON,c1870141.counterfilter)
end
function c1870141.counterfilter(c)
	return not c:IsAttribute(ATTRIBUTE_DARK)
end
function c1870141.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetCustomActivityCount(1870141,tp,ACTIVITY_SPSUMMON)==0 end
	--oath effects
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET+EFFECT_FLAG_OATH)
	e1:SetCode(EFFECT_CANNOT_SPECIAL_SUMMON)
	e1:SetReset(RESET_PHASE+PHASE_END)
	e1:SetTargetRange(1,0)
	e1:SetTarget(c1870141.splimit)
	Duel.RegisterEffect(e1,tp)
end
function c1870141.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(c1870141.filter,tp,LOCATION_DECK,0,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_DECK)
end
function c1870141.activate(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=Duel.SelectMatchingCard(tp,c1870141.filter,tp,LOCATION_DECK,0,1,1,nil)
	if g:GetCount()>0 then
		Duel.SendtoHand(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
	end
	if Duel.GetFlagEffect(tp,1870141)~=0 then return end
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetTargetRange(LOCATION_HAND,0)
	e1:SetCode(EFFECT_EXTRA_SUMMON_COUNT)
	e1:SetTarget(aux.TargetBoolFunction(Card.IsSetCard,0xab0))
	e1:SetReset(RESET_PHASE+PHASE_END)
	Duel.RegisterEffect(e1,tp)
	Duel.RegisterFlagEffect(tp,1870141,RESET_PHASE+PHASE_END,0,1)
end
function c1870141.splimit(e,c,sump,sumtype,sumpos,targetp,se)
	return c:IsAttribute(ATTRIBUTE_DARK)
end
function c1870141.filter(c)
	return c:IsSetCard(0xab0) and c:IsAbleToHand() and c:IsAttribute(ATTRIBUTE_LIGHT)
end