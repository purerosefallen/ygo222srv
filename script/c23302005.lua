--疵符「破裂的护符」
function c23302005.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCountLimit(1,23302005+EFFECT_COUNT_CODE_OATH)
	e1:SetOperation(c23302005.activate)
	c:RegisterEffect(e1)
	--act limit
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD)
	e2:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e2:SetCode(EFFECT_CANNOT_ACTIVATE)
	e2:SetRange(LOCATION_SZONE)
	e2:SetTargetRange(1,0)
	e2:SetValue(c23302005.aclimit)
	c:RegisterEffect(e2)
	--tohand
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(23302005,0))
	e3:SetCategory(CATEGORY_TOHAND)
	e3:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_O)
	e3:SetCode(EVENT_ATTACK_ANNOUNCE)
	e3:SetRange(LOCATION_GRAVE)
	e3:SetCountLimit(1,23302005)
	e3:SetCondition(c23302005.thcon)
	e3:SetCost(c23302005.cost)
	e3:SetTarget(c23302005.thtg)
	e3:SetOperation(c23302005.thop)
	c:RegisterEffect(e3)
end
function c23302005.atktg(e,c)
	return c:IsSetCard(0xddd)
end
function c23302005.activate(e,tp,eg,ep,ev,re,r,rp)
	if not e:GetHandler():IsRelateToEffect(e) then return end
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetCategory(CATEGORY_DESTROY)
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e1:SetCode(EVENT_BATTLE_START)
	e1:SetReset(RESET_PHASE+PHASE_END)
	e1:SetOperation(c23302005.operation)
	Duel.RegisterEffect(e1,tp)
end
function c23302005.operation(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetAttacker()
	local bc=Duel.GetAttackTarget()
	if not bc then return end
	if tc:IsControler(1-tp) then tc,bc=bc,tc end
	if tc:IsSetCard(0xddd) and not bc:IsRace(RACE_FAIRY) and bc:IsRelateToBattle() then
		Duel.Hint(HINT_CARD,0,23302005)
		Duel.Destroy(bc,REASON_EFFECT)
	end
end
function c23302005.aclimit(e,re,tp)
	return re:IsHasType(EFFECT_TYPE_ACTIVATE) and re:IsActiveType(TYPE_SPELL)
end
function c23302005.repfilter(c,tp)
	return c:IsFaceup() and c:IsControler(tp) and c:IsLocation(LOCATION_MZONE) and c:IsSetCard(0xddd)
		and c:IsReason(REASON_EFFECT+REASON_BATTLE)
end
function c23302005.reptg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return e:GetHandler():IsAbleToRemove() and eg:IsExists(c23302005.repfilter,1,nil,tp) end
	return Duel.SelectYesNo(tp,aux.Stringid(23302005,0))
end
function c23302005.repval(e,c)
	return c23302005.repfilter(c,e:GetHandlerPlayer())
end
function c23302005.repop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Remove(e:GetHandler(),POS_FACEUP,REASON_EFFECT)
end
function c23302005.thfilter(c)
	return c:IsFaceup() and not c:IsSetCard(0xddd)
end
function c23302005.thcon(e,tp,eg,ep,ev,re,r,rp)
	local at=Duel.GetAttacker()
	return at:GetControler()~=tp and not Duel.IsExistingMatchingCard(c23302005.thfilter,tp,LOCATION_MZONE,0,1,nil)
end
function c23302005.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return e:GetHandler():IsAbleToRemoveAsCost() end
	Duel.Remove(e:GetHandler(),POS_FACEUP,REASON_COST)
end
function c23302005.thtg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	local tg=Duel.GetAttacker()
	if chk==0 then return tg:IsOnField() and tg:IsAbleToHand() end
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,tg,1,0,0)
end
function c23302005.thop(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetAttacker()
	if not tc:IsImmuneToEffect(e) and tc:IsAttackable() and not tc:IsStatus(STATUS_ATTACK_CANCELED) then
		Duel.SendtoHand(tc,nil,REASON_EFFECT)
	end
end