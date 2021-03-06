--魔术的梦醒
function c66612317.initial_effect(c)
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCountLimit(1,66612317)
	e1:SetHintTiming(0,TIMING_END_PHASE)
	e1:SetCost(c66612317.cost)
	e1:SetTarget(c66612317.target)
	e1:SetOperation(c66612317.activate)
	c:RegisterEffect(e1)
	if not c66612317.global_check then
		c66612317.global_check=true
		local ge1=Effect.CreateEffect(c)
		ge1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		ge1:SetCode(EVENT_SPSUMMON_SUCCESS)
		ge1:SetOperation(c66612317.checkop)
		Duel.RegisterEffect(ge1,0)
		local ge2=Effect.CreateEffect(c)
		ge2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		ge2:SetCode(EVENT_PHASE_START+PHASE_DRAW)
		ge2:SetOperation(c66612317.clear)
		Duel.RegisterEffect(ge2,0)
	end
end
function c66612317.checkop(e,tp,eg,ep,ev,re,r,rp)
	local tc=eg:GetFirst()
	while tc do
		if not tc:IsSetCard(0x660) then
			c66612317[tc:GetSummonPlayer()]=false
		end
		tc=eg:GetNext()
	end
end
function c66612317.clear(e,tp,eg,ep,ev,re,r,rp)
	c66612317[0]=true
	c66612317[1]=true
end
function c66612317.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return c66612317[tp] end
end
function c66612317.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>1
		and Duel.IsPlayerCanSpecialSummonMonster(tp,66612321,0,0x4011,0,0,1,RACE_SPELLCASTER,ATTRIBUTE_DARK) and Duel.IsPlayerCanSpecialSummonMonster(tp,66612322,0,0x4011,0,0,1,RACE_WARRIOR,ATTRIBUTE_LIGHT) end
	local t={}
	local i=1
	local p=1
	local lv=e:GetHandler():GetLevel()
	for i=1,4 do 
		if lv~=i then t[p]=i p=p+1 end
	end
	t[p]=nil
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(26082117,1))
	e:SetLabel(Duel.AnnounceNumber(tp,table.unpack(t)))
	Duel.SetOperationInfo(0,CATEGORY_TOKEN,nil,4,0,0)
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,4,0,0)
end
function c66612317.activate(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetLocationCount(tp,LOCATION_MZONE)>1 
		and Duel.IsPlayerCanSpecialSummonMonster(tp,66612321,0,0x4011,0,0,1,RACE_SPELLCASTER,ATTRIBUTE_DARK) and Duel.IsPlayerCanSpecialSummonMonster(tp,66612322,0,0x4011,0,0,1,RACE_WARRIOR,ATTRIBUTE_LIGHT) then
		for m=4,5 do
			local token=Duel.CreateToken(tp,66612317+m)
			Duel.SpecialSummonStep(token,0,tp,tp,false,false,POS_FACEUP_DEFENSE)
			local e1=Effect.CreateEffect(e:GetHandler())
			e1:SetType(EFFECT_TYPE_SINGLE)
			e1:SetCode(EFFECT_UNRELEASABLE_SUM)
			e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
			e1:SetValue(1)
			e1:SetReset(RESET_EVENT+0x1fe0000)
			token:RegisterEffect(e1,true)
			local e2=Effect.CreateEffect(e:GetHandler())
			e2:SetType(EFFECT_TYPE_SINGLE)
			e2:SetCode(EFFECT_CANNOT_BE_SYNCHRO_MATERIAL)
			e2:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
			e2:SetValue(1)
			e2:SetReset(RESET_EVENT+0x1fe0000)
			token:RegisterEffect(e2,true)
			local e3=Effect.CreateEffect(e:GetHandler())
			e3:SetType(EFFECT_TYPE_SINGLE)
			e3:SetCode(EFFECT_CHANGE_LEVEL)
			e3:SetValue(e:GetLabel())
			e3:SetReset(RESET_EVENT+0x1fe0000)
			token:RegisterEffect(e3,true)
		end
		Duel.SpecialSummonComplete()
	end
end