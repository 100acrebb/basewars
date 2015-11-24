AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:SetLevel(level)
	return self:SetNWInt("upgrade", level)
end

function ENT:Upgrade(ply)
	--[[
	if (not self.Price or self.Price == 1337 and self.Payout) then
		self.Price = self.Payout[1]
	end]]
	-- No more self.Payout, I don't even care about backwards compat,
	-- That system was fucking stupid.
	
	local level = self:GetLevel()
	local nextLevel = level + 1
	
	local priceToUpgrade = self.Price * level
	
	if (level < 1) then
		priceToUpgrade = self.Price
	end
	
	if (nextLevel > self.MaxLevel) then
		return false, "Already fully upgraded"
	end
	
	if (not ply:CanAfford(priceToUpgrade)) then
		return false, "Can't afford to upgrade ("..BaseWars.MoneyFormat(priceToUpgrade)..")"
	end
	
	local suc, err = self:UpgradeCheck(ply)
	
	if (not suc) then
		return false, err
	end
	
	self.CurrentValue = self.CurrentValue + priceToUpgrade
	
	ply:AddMoney(priceToUpgrade * -1)
	self:SetLevel(nextLevel)
	return true, "", nextlevel
end

function ENT:UpgradeCheck(ply)
	-- To be overridden.
	return true
end

function ENT:RawValid(attacker)
	local valid = false
	local aTeam, mTeam = attacker:Team(), self.Owner:Team()
	local lgc1, lgc2, lgc3, lgc4, lgc5
	
	if BaseWars.ONGOINGRAID then
		lgc1 = 	((BaseWars.ONGOINGRAID[2] == attacker) or (BaseWars.ONGOINGRAID[2] == aTeam))
		lgc2 = 	((BaseWars.ONGOINGRAID[1] == self.Owner) or (BaseWars.ONGOINGRAID[1] == self.Owner:Team()))
		lgc3 = 	((BaseWars.ONGOINGRAID[2] == self.Owner) or (BaseWars.ONGOINGRAID[2] == self.Owner:Team()))
		lgc4 = 	((BaseWars.ONGOINGRAID[1] == attacker) or (BaseWars.ONGOINGRAID[1] == aTeam))
	end
	
	lgc5 = ((attacker == self.Owner or (attacker.GetOwner and attacker:GetOwner()) == self.Owner) and not (lgc2 or lgc3))
	--print(lgc5)
	
	if (lgc1 and lgc2) or (lgc3 and lgc4) or lgc5 then
		valid = true
	end
	
	if ((self.Owner:Team() == aTeam and self.Owner:Team() ~= 1) and not valid) then
		return false
	end
	
	return valid
end

function ENT:ValidateRaid(attacker)
	if self.NoARR then
		if self.DEBUG then HSP.CAT(color_red, tostring(self).."..NoARR") end
		return true
	end
	if IsValid(self.Owner) then
		if (not IsValid(attacker)) then return false end
		
		if (attacker:IsPlayer()) then
			if self.DEBUG then HSP.CAT(color_green, tostring(self).."..RawValidOnAttacker") end
			return self:RawValid(attacker)
			
		elseif (attacker.GetOwner and attacker:GetOwner():IsPlayer()) then
			if self.DEBUG then HSP.CAT(color_green, tostring(self).."..RawValidOnOwner") end
			return self:RawValid(attacker:GetOwner())
			
		else
			if self.DEBUG then HSP.CAT(color_red, tostring(self).."..Invalid") end
			print("Attacker not player or not valid")
			return false
			
		end
	end
	return false
end

function ENT:DeployMoney(attacker)
	-- They are destroying their own stuff
	if (attacker:IsPlayer()) then
		local value = self.CurrentValue
		local aTeam = attacker:Team()
		
		if (attacker == self.Owner) then
			local back	= value * .75
			
			back = math.ceil(back)
			
			local payMessage = Format("Paid £%s back for destroying your %s", back, self.PrintName)
			Notify(attacker, 2, 3, payMessage)
			
			attacker:AddMoney(back)
		
		-- They are a citizen, or they are a cheeky sod trying to exploit this
		elseif (aTeam == 1 or #team.GetPlayers(aTeam) <= 1) then
			-- 70% of the total value (60% paid so far)
			local pay	= value * .6
			
			pay = math.ceil(pay)
			
			local payMessage = Format("Paid £%s for destroying a %s", pay, self.PrintName)
			Notify(attacker, 2, 3, payMessage)
			
			attacker:AddMoney(pay)
			
			-- It's a printer so we give them EXP.
			if self.CalculateMoney then
				attacker:AwardEXP("destroying a printer in a raid")
			end
			
			local owner = self.Owner
			if (owner and IsValid(owner)) then
				
				-- 20% of the total value (80% paid total, 10% lost 'in the explosion', less efficient than faction raiding)
				local back	= value * .2
				
				back = math.ceil(back)
			
				local payMessage2 = Format("Paid £%s back from the destruction of a(n) %s", back, self.PrintName)
				Notify(owner, 2, 3, payMessage2)
				owner:AddMoney(back)
			end
			
		-- They are part of a faction (This is the fancy shit)
		else
			-- 75% of the total value (70% paid out so far)
			local pay	= value * .7
			
			pay = math.ceil(pay)
			
			local aTeamP = team.GetPlayers(aTeam)
			local rec = #aTeamP
			
			-- Divide it as if there is 1 extra person.
			local PP = pay / (rec + 1)
			
			-- Give the extra chunk to the person who destroyed it.
			local dPP = PP * 2
			
			local payMessage = Format("Paid £%s for destroying a %s", PP, self.PrintName)
			local payMessage2 = Format("Paid £%s for destroying a %s", dPP, self.PrintName)
				
			for _, v in ipairs(aTeamP) do
				if v == attacker then continue end
				
				Notify(v, 2, 3, payMessage)
				v:AddMoney(PP)
			end
			
			Notify(attacker, 2, 3, payMessage2)
			attacker:AddMoney(dPP)
			
			-- It's a printer so we give them EXP.
			if self.CalculateMoney then
				attacker:AwardEXP("destroying a printer in a raid")
			end
			
			local owner = self.Owner
			if (owner and IsValid(owner)) then
				
				-- 20% of the total value (90% paid total, 5% lost 'in the explosion')
				local back	= value * .2
				
				back = math.ceil(back)
			
				local payMessage3 = Format("Paid £%s back from the destruction of a(n) %s", back, self.PrintName)
				Notify(owner, 2, 3, payMessage3)
				owner:AddMoney(back)
			end
			
		end
	end
end

function ENT:OnTakeDamage(dmg)
	local damage 	= dmg:GetDamage()
	local attacker 	= dmg:GetAttacker()
	
	local valid = self:ValidateRaid(attacker)
	
	if (not valid and IsValid(attacker) and attacker:IsPlayer()) then
		if self.DEBUG then HSP.CAT(color_red, tostring(self).."..InvalidRaid") end
		Notify(attacker, 4, 3, "You need to be in a raid to destroy that!")
		return
	end
	
	if (self.Entity:GetNWInt("Health") > 0) then
		self.Entity:SetNWInt("Health", self.Entity:GetNWInt("Health") - damage)
		
		if (self.Entity:GetNWInt("Health") <= 0) then
			self:DeployMoney(attacker)
			self:Explode()
			self:Remove()
		end
	end
end

function ENT:Explode()
	if not IsValid(self) then return end
	
	local vPoint = self:GetPos()
	local effectdata = EffectData() 
		effectdata:SetStart(vPoint)
		effectdata:SetOrigin(vPoint)
		effectdata:SetScale(1)
	util.Effect("Explosion", effectdata)
end
