--奔放不羁的觉 古明地觉
function c45712525.initial_effect(c)
    --pendulum summon
    aux.EnablePendulumAttribute(c)
	--spsummon
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(45712525,3))
	e2:SetCategory(CATEGORY_DISABLE)
	e2:SetType(EFFECT_TYPE_IGNITION)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCountLimit(1,45712525)
	e2:SetCost(c45712525.cost)
	e2:SetTarget(c45712525.sptg)
	e2:SetOperation(c45712525.spop)
	c:RegisterEffect(e2)
	--special summon
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(45712525,4))
	e3:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e3:SetType(EFFECT_TYPE_IGNITION)
	e3:SetRange(LOCATION_HAND)
	e3:SetCountLimit(1,45712526)
	e3:SetCost(c45712525.spcost)
	e3:SetTarget(c45712525.sptarget)
	e3:SetOperation(c45712525.spoperation)
	c:RegisterEffect(e3)
	--spsummon limit
	local e4=Effect.CreateEffect(c)
	e4:SetProperty(EFFECT_FLAG_UNCOPYABLE)
	e4:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e4:SetCode(EVENT_SPSUMMON_SUCCESS)
	e4:SetCondition(c45712525.limcon)
	e4:SetOperation(c45712525.limop)
	c:RegisterEffect(e4)
	--search
	local e5=Effect.CreateEffect(c)
	e5:SetDescription(aux.Stringid(45712525,6))
	e5:SetType(EFFECT_TYPE_IGNITION)
	e5:SetCountLimit(1,45712527)
	e5:SetRange(LOCATION_PZONE)
	e5:SetCost(c45712525.cost)
	e5:SetTarget(c45712525.target)
	e5:SetOperation(c45712525.operation)
	c:RegisterEffect(e5)
	--splimit
	local ed=Effect.CreateEffect(c)
	ed:SetType(EFFECT_TYPE_FIELD)
	ed:SetCode(EFFECT_CANNOT_SPECIAL_SUMMON)
	ed:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	ed:SetRange(LOCATION_PZONE)
	ed:SetTargetRange(1,0)
	ed:SetTarget(c45712525.splimit)
	c:RegisterEffect(ed)
end
function c45712525.splimit(e,c,tp,sumtp,sumpos)
	local seq=e:GetHandler():GetSequence()
	local tc=Duel.GetFieldCard(e:GetHandlerPlayer(),LOCATION_SZONE,13-seq)
	if tc and not tc:IsSetCard(0x22b) then
		return true
	else
		return false
	end
end
function c45712525.limcon(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():GetSummonType()==SUMMON_TYPE_SPECIAL+1
end
function c45712525.limop(e,tp,eg,ep,ev,re,r,rp)
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetCode(EFFECT_CANNOT_SPECIAL_SUMMON)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e1:SetTargetRange(1,0)
	e1:SetTarget(c45712525.splimit2)
	e1:SetReset(RESET_PHASE+PHASE_END)
	Duel.RegisterEffect(e1,tp)
end
function c45712525.splimit2(e,c,sump,sumtype,sumpos,targetp,se)
	return not c:IsRace(RACE_PSYCHO)
end
function c45712525.filter1(c)
	return not c:IsPublic()
end
function c45712525.spcost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return not e:GetHandler():IsPublic() end
end
function c45712525.sptarget(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>0 and e:GetHandler():IsCanBeSpecialSummoned(e,0,tp,false,false) end
	if Duel.GetFieldGroupCount(tp,0,LOCATION_HAND)==Duel.GetMatchingGroupCount(Card.IsPublic,tp,0,LOCATION_HAND,nil)
		and not Duel.IsExistingMatchingCard(c45712525.filter1,tp,0,LOCATION_HAND,1,nil) then
		Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,e:GetHandler(),1,0,0)
	end
end
function c45712525.spoperation(e,tp,eg,ep,ev,re,r,rp,c)
	local dis=false
	if Duel.IsChainDisablable(0) then
		local cg=Duel.GetMatchingGroup(c45712525.filter1,tp,0,LOCATION_HAND,nil)
		if cg:GetCount()>0 and Duel.SelectYesNo(1-tp,aux.Stringid(45712525,2)) then
			Duel.Hint(HINT_SELECTMSG,1-tp,HINTMSG_CONFIRM)
			local sg=cg:Select(1-tp,1,1,nil)
			--Duel.ConfirmCards(tp,sg)
			local tc=sg:GetFirst()
			local e1=Effect.CreateEffect(e:GetHandler())
			e1:SetType(EFFECT_TYPE_SINGLE)
			e1:SetCode(EFFECT_PUBLIC)
			e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
			tc:RegisterEffect(e1)
			Duel.ShuffleHand(1-tp)
			return
		end
	end
	local c=e:GetHandler()
	if Duel.GetLocationCount(tp,LOCATION_MZONE)<=0 then return end
	if c:IsRelateToEffect(e) then
		Duel.SpecialSummon(c,0,tp,tp,false,false,POS_FACEUP)
	end
end
function c45712525.cffilter(c)
	return c:IsRace(RACE_PSYCHO) and not c:IsPublic()
end
function c45712525.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(c45712525.cffilter,tp,LOCATION_HAND,0,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_CONFIRM)
	local g=Duel.SelectMatchingCard(tp,c45712525.cffilter,tp,LOCATION_HAND,0,1,1,nil)
	Duel.ConfirmCards(1-tp,g)
	Duel.ShuffleHand(tp)
end
function c45712525.filter(c)
	return c:IsSetCard(0x22b) and c:IsType(TYPE_MONSTER) and c:IsAbleToHand()
end
function c45712525.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(Card.IsDestructable,tp,0,LOCATION_MZONE,1,nil) end
	if Duel.GetFieldGroupCount(tp,0,LOCATION_HAND)==Duel.GetMatchingGroupCount(Card.IsPublic,tp,0,LOCATION_HAND,nil)
		and not Duel.IsExistingMatchingCard(Card.IsType,tp,0,LOCATION_HAND,1,nil,TYPE_MONSTER) then
		Duel.SetOperationInfo(0,CATEGORY_DESTROY,g,1,0,0)
	end
end
function c45712525.cfilter(c)
	return c:IsType(TYPE_MONSTER) and not c:IsPublic() 
end
function c45712525.operation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if not c:IsRelateToEffect(e) or c:IsFacedown() then return end
	local dis=false
	if Duel.IsChainDisablable(0) then
		local cg=Duel.GetMatchingGroup(c45712525.cfilter,tp,0,LOCATION_HAND,nil)
		if cg:GetCount()>0 and Duel.SelectYesNo(1-tp,aux.Stringid(45712525,1)) then
			Duel.Hint(HINT_SELECTMSG,1-tp,HINTMSG_CONFIRM)
			local sg=cg:Select(1-tp,1,1,nil)
			--Duel.ConfirmCards(tp,sg)
			local tc=sg:GetFirst()
			local e1=Effect.CreateEffect(e:GetHandler())
			e1:SetType(EFFECT_TYPE_SINGLE)
			e1:SetCode(EFFECT_PUBLIC)
			e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
			tc:RegisterEffect(e1)
			Duel.ShuffleHand(1-tp)
			return
		end
	end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)
	local g=Duel.SelectMatchingCard(tp,Card.IsDestructable,tp,0,LOCATION_MZONE,1,1,nil)
	if g:GetCount()>0 then
		Duel.HintSelection(g)
		Duel.Destroy(g,REASON_EFFECT)
	end
end
function c45712525.spfilter(c,e,tp)
	return c:IsSetCard(0x22b) and c:IsType(TYPE_MONSTER) and c:IsCanBeSpecialSummoned(e,0,tp,false,false)
end
function c45712525.sptg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(c45712525.dfilter,tp,0,LOCATION_ONFIELD,1,nil) end
	if Duel.GetFieldGroupCount(tp,0,LOCATION_HAND)==Duel.GetMatchingGroupCount(Card.IsPublic,tp,0,LOCATION_HAND,nil)
		and not Duel.IsExistingMatchingCard(c45712525.cfilter,tp,0,LOCATION_HAND,1,nil) then
		Duel.SetOperationInfo(0,CATEGORY_DISABLE,g,1,0,0)
	end
end
function c45712525.dfilter(c)
	return c:IsFaceup() and not c:IsDisabled() and (c:IsLocation(LOCATION_SZONE) or c:IsType(TYPE_EFFECT))
end
function c45712525.spop(e,tp,eg,ep,ev,re,r,rp)
	local dis=false
	if Duel.IsChainDisablable(0) then
		local cg=Duel.GetMatchingGroup(c45712525.cfilter,tp,0,LOCATION_HAND,nil)
		if cg:GetCount()>0 and Duel.SelectYesNo(1-tp,aux.Stringid(45712525,7)) then
			Duel.Hint(HINT_SELECTMSG,1-tp,HINTMSG_CONFIRM)
			local sg=cg:Select(1-tp,1,1,nil)
			--Duel.ConfirmCards(tp,sg)
			local tc=sg:GetFirst()
			local e1=Effect.CreateEffect(e:GetHandler())
			e1:SetType(EFFECT_TYPE_SINGLE)
			e1:SetCode(EFFECT_PUBLIC)
			e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
			tc:RegisterEffect(e1)
			Duel.ShuffleHand(1-tp)
			return
		end
	end
	local g=Duel.GetMatchingGroup(c45712525.dfilter,tp,0,LOCATION_ONFIELD,nil)
	local tc=g:GetFirst()
	if not tc then return end
	local c=e:GetHandler()
	while tc do
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_DISABLE)
		e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
		tc:RegisterEffect(e1)
		local e2=Effect.CreateEffect(c)
		e2:SetType(EFFECT_TYPE_SINGLE)
		e2:SetCode(EFFECT_DISABLE_EFFECT)
		e2:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
		tc:RegisterEffect(e2)
		tc=g:GetNext()
	end
end