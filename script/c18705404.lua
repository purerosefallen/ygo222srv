--灵使少女 希塔
function c18705404.initial_effect(c)
	--search
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(95027497,0))
	e1:SetCategory(CATEGORY_TOHAND+CATEGORY_SEARCH)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e1:SetProperty(EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_DELAY)
	e1:SetCountLimit(1,18705404)
	e1:SetCode(EVENT_SUMMON_SUCCESS)
	e1:SetTarget(c18705404.tg1)
	e1:SetOperation(c18705404.op1)
	c:RegisterEffect(e1)
	local e2=e1:Clone()
	e2:SetCode(EVENT_SPSUMMON_SUCCESS)
	e2:SetCondition(c18705404.con)
	c:RegisterEffect(e2)
	--special summon
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(73176465,0))
	e1:SetCategory(CATEGORY_TOHAND)
	e1:SetProperty(EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_DELAY+EFFECT_FLAG_CHAIN_UNIQUE)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e1:SetCountLimit(1,18705404)
	e1:SetCode(EVENT_TO_GRAVE)
	e1:SetCondition(c18705404.discon)
	e1:SetTarget(c18705404.distarget)
	e1:SetOperation(c18705404.disoperation)
	c:RegisterEffect(e1)
end
function c18705404.filter(c)
	return c:IsAbleToHand() and (c:IsCode(18705401) or c:IsCode(18705402) or c:IsCode(18705403)) and not c:IsCode(18705404)
end
function c18705404.tg1(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(c18705404.filter,tp,LOCATION_DECK,0,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_DECK)
end
function c18705404.op1(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=Duel.SelectMatchingCard(tp,c18705404.filter,tp,LOCATION_DECK,0,1,1,nil)
	if g:GetCount()>0 then
		Duel.SendtoHand(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
	end
end
function c18705404.con(e,tp,eg,ep,ev,re,r,rp)
	return re:GetHandler():IsType(TYPE_MONSTER)
end
function c18705404.discon(e,tp,eg,ep,ev,re,r,rp)
	return (bit.band(r,REASON_EFFECT)~=0 and re:GetHandler():IsSetCard(0xabb) and re:GetHandler():IsType(TYPE_MONSTER)) or (e:GetHandler():IsReason(REASON_COST) and re:GetHandler():IsType(TYPE_MONSTER) and re:GetHandler():IsSetCard(0xabb)) and bit.band(r,REASON_RETURN)==0
end
function c18705404.distarget(e,tp,eg,ep,ev,re,r,rp,chk)
	if chkc then return chkc:IsControler(tp) and chkc:IsLocation(LOCATION_GRAVE) and c18705404.filter(chkc) end
	if chk==0 then return Duel.IsExistingTarget(c18705404.filter,tp,LOCATION_GRAVE,0,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=Duel.SelectTarget(tp,c18705404.filter,tp,LOCATION_GRAVE,0,1,1,nil)
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,g,1,0,0)
end
function c18705404.disoperation(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) then
		Duel.SendtoHand(tc,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,tc)
	end
end