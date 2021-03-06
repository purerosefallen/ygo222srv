--素体 御坂美琴
function c23306007.initial_effect(c)
	--synchro summon
	aux.AddSynchroProcedure(c,aux.FilterBoolFunction(Card.IsAttribute,ATTRIBUTE_LIGHT),aux.NonTuner(nil),1)
	c:EnableReviveLimit()
	--special summon
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCountLimit(1,23306007)
	e1:SetCost(c23306007.spcost)
	e1:SetTarget(c23306007.sptg)
	e1:SetOperation(c23306007.spop)
	c:RegisterEffect(e1)
end
function c23306007.spcost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return e:GetHandler():IsReleasable() end
	Duel.Release(e:GetHandler(),REASON_COST)
end
function c23306007.filter(c,e,tp)
	return c:IsSetCard(0x2997) and c:IsCanBeSpecialSummoned(e,0,tp,false,false)
end
function c23306007.sfilter(c,e,tp)
	return c:IsSetCard(0x1997) and c:IsCanBeSpecialSummoned(e,0,tp,false,false)
end
function c23306007.sptg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
		and Duel.IsExistingMatchingCard(c23306007.filter,tp,LOCATION_GRAVE,0,1,nil,e,tp) end
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,1,tp,LOCATION_GRAVE)
end
function c23306007.spop(e,tp,eg,ep,ev,re,r,rp)
	local ft=Duel.GetLocationCount(tp,LOCATION_MZONE)
	if ft<=0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g=Duel.SelectMatchingCard(tp,c23306007.filter,tp,LOCATION_GRAVE,0,1,ft,nil,e,tp)
	if g:GetCount()>0 then
		Duel.SpecialSummon(g,0,tp,tp,false,false,POS_FACEUP)
	end
	-- if g:GetCount()>0 and Duel.SpecialSummon(g,0,tp,tp,false,false,POS_FACEUP)>0 and Duel.IsExistingMatchingCard(c23306007.sfilter,tp,LOCATION_HAND,0,1,nil,e,tp) and Duel.GetLocationCount(tp,LOCATION_MZONE)>0 and Duel.SelectYesNo(tp,aux.Stringid(23306007,0)) then
		-- Duel.BreakEffect()
		-- ft=Duel.GetLocationCount(tp,LOCATION_MZONE)
		-- if ft>2 then ft=2 end
		-- Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
		-- local sg=Duel.SelectMatchingCard(tp,c23306007.sfilter,tp,LOCATION_HAND,0,1,ft,nil,e,tp)
		-- Duel.SpecialSummon(sg,0,tp,tp,false,false,POS_FACEUP)
	-- end
end