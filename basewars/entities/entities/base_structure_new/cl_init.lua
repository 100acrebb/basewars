include('shared.lua')

function ENT:Think()
	if (tonumber(LocalPlayer():GetInfo("bw_showsparks") or 1)) then
		if (self.dospark == nil) then self.dospark = 0 end
		if self.Entity:GetNWBool("sparking") and self.SparkPos and self.dospark == 0 then
			self.dospark=self.dospark + 1
			local ang = self.Entity:GetAngles()
			local spos = self.SparkPos
			local effectdata = EffectData()
				effectdata:SetOrigin(self.Entity:GetPos() + ang:Forward() * spos.x + ang:Right() * spos.y + ang:Up() * spos.z)
				effectdata:SetMagnitude(1)
				effectdata:SetScale(1)
				effectdata:SetRadius(2)
			util.Effect("Sparks", effectdata)
		else
			self.dospark = self.dospark + 1
			if self.dospark == 3 then self.dospark = 0 end
		end
		self.Entity:NextThink(CurTime() + 1)
		return true
	end
	self.Entity:NextThink(CurTime() + 2)
	return true
end
