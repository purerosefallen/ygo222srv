--魔创龙 桂妮薇儿
function c23305007.initial_effect(c)
	--summon with 1 tribute
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(23305007,0))
	e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_SUMMON_PROC)
	e1:SetCondition(c23305007.otcon)
	e1:SetOperation(c23305007.otop)
	e1:SetValue(SUMMON_TYPE_ADVANCE)
	c:RegisterEffect(e1)
	local e2=e1:Clone()
	e2:SetCode(EFFECT_SET_PROC)
	c:RegisterEffect(e2)
	--special summon
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_FIELD)
	e3:SetCode(EFFECT_SPSUMMON_PROC)
	e3:SetProperty(EFFECT_FLAG_SPSUM_PARAM)
	e3:SetTargetRange(POS_FACEUP_DEFENSE,0)
	e3:SetRange(LOCATION_HAND)
	e3:SetCondition(c23305007.spcon)
	e3:SetOperation(c23305007.spop)
	c:RegisterEffect(e3)
	--summon
	local e4=Effect.CreateEffect(c)
	e4:SetDescription(aux.Stringid(23305007,2))
	e4:SetCategory(CATEGORY_SUMMON)
	e4:SetType(EFFECT_TYPE_QUICK_O)
	e4:SetRange(LOCATION_HAND)
	e4:SetCode(EVENT_FREE_CHAIN)
	e4:SetHintTiming(0,0x1c0+TIMING_MAIN_END)
	e4:SetCountLimit(1,23305007)
	e4:SetCondition(c23305007.sumcon)
	e4:SetCost(c23305007.sumcost)
	e4:SetTarget(c23305007.sumtg)
	e4:SetOperation(c23305007.sumop)
	c:RegisterEffect(e4)
	--to hand
	local e5=Effect.CreateEffect(c)
	e5:SetDescription(aux.Stringid(23305007,1))
	e5:SetCategory(CATEGORY_TOGRAVE)
	e5:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e5:SetProperty(EFFECT_FLAG_DELAY+EFFECT_FLAG_DAMAGE_STEP)
	e5:SetCode(EVENT_SUMMON_SUCCESS)
	e5:SetCountLimit(1,91100081)
	e5:SetCondition(c23305007.con)
	e5:SetTarget(c23305007.tg)
	e5:SetOperation(c23305007.op)
	c:RegisterEffect(e5)
	local e6=e5:Clone()
	e6:SetCode(EVENT_REMOVE)
	e6:SetCondition(c23305007.recon)
	c:RegisterEffect(e6)
end
function c23305007.otfilter(c)
	return c:GetSummonLocation()==LOCATION_EXTRA or c:IsSetCard(0x996)
end
function c23305007.otcon(e,c)
	if c==nil then return true end
	local mg=Duel.GetMatchingGroup(c23305007.otfilter,0,LOCATION_MZONE,LOCATION_MZONE,nil)
	return c:GetLevel()>6 and Duel.GetLocationCount(c:GetControler(),LOCATION_MZONE)>-1
		and Duel.GetTributeCount(c,mg)>0
end
function c23305007.otop(e,tp,eg,ep,ev,re,r,rp,c)
	local mg=Duel.GetMatchingGroup(c23305007.otfilter,0,LOCATION_MZONE,LOCATION_MZONE,nil)
	local sg=Duel.SelectTribute(tp,c,1,1,mg)
	c:SetMaterial(sg)
	Duel.Release(sg,REASON_SUMMON+REASON_MATERIAL)
end
function c23305007.spfilter(c)
	return c:IsType(TYPE_MONSTER) and c:IsRace(RACE_DRAGON) and c:IsDiscardable()
end
function c23305007.spcon(e,c)
	if c==nil then return true end
	local tp=c:GetControler()
	return Duel.GetLocationCount(c:GetControler(),LOCATION_MZONE)>0
		and Duel.IsExistingMatchingCard(c23305007.spfilter,tp,LOCATION_HAND,0,1,c)
end
function c23305007.spop(e,tp,eg,ep,ev,re,r,rp,c)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DISCARD)
	Duel.DiscardHand(tp,c23305007.spfilter,1,1,REASON_COST+REASON_DISCARD,c)
end
function c23305007.sumcon(e,tp,eg,ep,ev,re,r,rp)
	local ph=Duel.GetCurrentPhase()
	return (ph==PHASE_MAIN1 or ph==PHASE_MAIN2)
end
function c23305007.cfilter(c)
	return c:IsSetCard(0x996) and c:IsAbleToRemoveAsCost()
end
function c23305007.sumcost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(c23305007.cfilter,tp,LOCATION_GRAVE,0,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_REMOVE)
	local g=Duel.SelectMatchingCard(tp,c23305007.cfilter,tp,LOCATION_GRAVE,0,1,1,nil)
	Duel.Remove(g,POS_FACEUP,REASON_COST)
end
function c23305007.sumtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return e:GetHandler():IsSummonable(true,nil,1) end
	Duel.SetOperationInfo(0,CATEGORY_SUMMON,e:GetHandler(),1,0,0)
end
function c23305007.sumop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if c:IsRelateToEffect(e) and c:IsSummonable(true,nil,1) then
		Duel.Summon(tp,c,true,nil,1)
	end
end
function c23305007.con(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():GetSummonType()==SUMMON_TYPE_ADVANCE
end
function c23305007.recon(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():IsReason(REASON_COST) and re:IsHasType(0x7f4)
end
function c23305007.tg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chk==0 then return Duel.IsPlayerCanDraw(tp,2) end
	Duel.SetTargetPlayer(tp)
	Duel.SetTargetParam(2)
	Duel.SetOperationInfo(0,CATEGORY_DRAW,nil,0,tp,2)
	Duel.SetOperationInfo(0,CATEGORY_HANDES,nil,0,tp,1)
end
function c23305007.op(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local p=Duel.GetChainInfo(0,CHAININFO_TARGET_PLAYER)
	if Duel.Draw(p,2,REASON_EFFECT)==2 then
		Duel.ShuffleHand(tp)
		Duel.BreakEffect()
		Duel.DiscardHand(tp,nil,1,1,REASON_EFFECT+REASON_DISCARD)
		if c:IsRelateToEffect(e) and c:IsLocation(LOCATION_MZONE) then
			Duel.ChangePosition(c,POS_FACEUP_DEFENSE)
		end
	end
end