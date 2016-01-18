ENT.Base = "bw_base_electronics"
ENT.Type = "anim"

ENT.PrintName = "Radar Transmitter"
ENT.Model = "models/props_rooftop/roof_dish001.mdl"

ENT.PowerRequired = 20
ENT.PowerCapacity = 5000

ENT.AllwaysRaidable = true

if SERVER then

	AddCSLuaFile()

	function ENT:SetMinimap(ply, bool)
	
		ply:SetNW2Bool("BaseWars_HasRadar", bool)
	
	end
	
	function ENT:ThinkFunc(activator, caller, usetype, value)

		local Owner = BaseWars.Ents:ValidOwner(self)
		if not Owner then return end
	
		local tr = {}
			tr.start 	= self:GetPos()
			tr.endpos 	= tr.start + Vector(0, 0, 24000)
			tr.filter 	= self
		tr = util.TraceLine(tr)
	
		if not tr.HitSky then
	
			if self.Enabled then
	
				self:SetMinimap(Owner, false)
				self:EmitSound("ambient/machines/thumper_shutdown1.wav")
				
				self.Enabled = false
				
			end
			
		else
		
			self:SetMinimap(Owner, true)
			
			self.Enabled = true
			
		end
		
	end

	function ENT:OnRemove()

		local Owner = BaseWars.Ents:ValidOwner(self)
		if Owner then
		
			self:SetMinimap(Owner, false)
			
		end
		
	end

end
