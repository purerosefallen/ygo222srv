--Sawawa-Border of Life
require "script/c37564765"
function c37564225.initial_effect(c)
	c:EnableReviveLimit()
--tg
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(37564225,0))
	e1:SetCategory(CATEGORY_TOGRAVE)
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_QUICK_F)
	e1:SetCode(EVENT_CHAINING)
	e1:SetProperty(EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_DAMAGE_CAL)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCountLimit(4,375642251)
	e1:SetCondition(c37564225.discon)
	e1:SetTarget(c37564225.distg)
	e1:SetOperation(c37564225.disop)
	c:RegisterEffect(e1)
--ss
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(37564225,1))
	e3:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e3:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e3:SetProperty(EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_DELAY+EFFECT_FLAG_CARD_TARGET)
	e3:SetCode(EVENT_TO_GRAVE)
	e3:SetCountLimit(1,375642252+EFFECT_COUNT_CODE_DUEL)
	e3:SetCost(c37564225.cost)
	e3:SetCondition(c37564225.spcon)
	e3:SetTarget(c37564225.sptg)
	e3:SetOperation(c37564225.spop)
	c:RegisterEffect(e3)
end
function c37564225.discon(e,tp,eg,ep,ev,re,r,rp)
	return re:IsActiveType(TYPE_MONSTER) and re:GetHandler()~=e:GetHandler() and ep~=tp and senya.swwblex(e,tp)
end
function c37564225.distg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(Card.IsAbleToGrave,tp,0,LOCATION_EXTRA,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TOGRAVE,nil,1,1-tp,LOCATION_EXTRA)
end
function c37564225.disop(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(Card.IsAbleToGrave,tp,0,LOCATION_EXTRA,nil)
	if g:GetCount()>0 then
		Duel.Hint(HINT_SELECTMSG,1-tp,HINTMSG_TOGRAVE)
		sg=g:Select(1-tp,1,1,nil)
		Duel.SendtoGrave(sg,REASON_EFFECT)
		local og=Duel.GetOperatedGroup()
		if og:GetCount()>0 then
			local tc=og:GetFirst()
			if tc:IsLocation(LOCATION_GRAVE) then
				tc:RegisterFlagEffect(37564225,RESET_EVENT+0x1fe0000,0,1)
			end
		end
	end
end
function c37564225.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.PayLPCost(tp,math.floor(Duel.GetLP(tp)/2))
end
function c37564225.spcon(e,tp,eg,ep,ev,re,r,rp)
	return rp~=tp and e:GetHandler():GetPreviousControler()==tp and e:GetHandler():IsReason(REASON_DESTROY)
end
function c37564225.filter(c,e,tp)
	return c:GetFlagEffect(37564225)>0 and c:IsCanBeSpecialSummoned(e,0,tp,true,true)
end
function c37564225.sptg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsLocation(LOCATION_GRAVE) and c37564225.filter(chkc,e,tp) end
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
		and Duel.IsExistingTarget(c37564225.filter,tp,0,LOCATION_GRAVE,1,nil,e,tp) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g=Duel.SelectTarget(tp,c37564225.filter,tp,0,LOCATION_GRAVE,1,1,nil,e,tp)
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,g,1,0,0)
end
function c37564225.spop(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) then
		for i=2,11 do
			Duel.Hint(HINT_OPSELECTED,1-tp,aux.Stringid(37564225,i))
		end
		local oc=Duel.SpecialSummon(tc,0,tp,tp,true,true,POS_FACEUP)
		tc:CompleteProcedure()
		if oc>0 and tc:IsType(TYPE_XYZ) and e:GetHandler():IsLocation(LOCATION_GRAVE) then
			if Duel.SelectYesNo(tp,aux.Stringid(37564225,12)) then
				Duel.Overlay(tc,Group.FromCards(e:GetHandler()))
			end
		end
	end
end