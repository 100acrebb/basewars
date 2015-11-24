AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:Initialize()
	self:SetModel("models/weapons/w_smg1.mdl")
	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_VPHYSICS)
	
	local headshot = ents.Create("info_target")
	
	self.Aimtarg 	= headshot
	self.Firing 	= false
	self.NextShot 	= 0
	self.MaxRange 	= 1000
	self.SawShit 	= 0
	self.BeepTime 	= 0
	
	util.PrecacheSound("buttons/blip2.wav")
end

function ENT:FireShot(targ)
	if (self.NextShot > CurTime() or not self.Body:GetNWBool("IsActive")) then return end
	self.NextShot = CurTime() + 0.17
	
	self:EmitSound("Weapon_Pistol.Single")

	local Attachment = self:GetAttachment(1)
	
	local shootOrigin = Attachment.Pos
	local shootAngles = self:GetAngles()
	local shootDir = shootAngles:Forward()
	
	local damage = 10 + (5 * self.Body:GetLevel())
	
	if (self.Body.DEBUG) then HSP.CAT(color_red, "DMG: "..damage.." Targ: "..targ) end
	
	targ:TakeDamage(damage, self:GetOwner(), self)
		
	-- Shoot a bullet
	local bullet = {}
		bullet.Num 		= 1
		bullet.Src 		= shootOrigin
		bullet.Dir 		= shootDir
		bullet.Spread 		= Vector( 0, 0, 0 )
		bullet.Tracer		= 1
		bullet.TracerName 	= "AirboatGunHeavyTracer"
		bullet.Force		= 50
		bullet.Damage		= 0
		bullet.Attacker 	= self:GetOwner()		
	self:FireBullets( bullet )
	
	-- Make a muzzle flash
	local effectdata = EffectData()
		effectdata:SetOrigin( shootOrigin )
		effectdata:SetAngles( shootAngles )
		effectdata:SetScale( 1 )
	util.Effect( "MuzzleEffect", effectdata )
	
end

function ENT:Think()
	if (self.Body:IsBuilt()) then
		local nearesttarg = self
		local Attachment = self:GetAttachment( 1 )
		local shootOrigin = Attachment.Pos
		
		local owner = self:GetOwner()
		if (not IsValid(owner)) then
			owner = self.Owner
		end
		if (not IsValid(owner)) then return end
		
		for k, v in next, ents.FindInSphere(self:GetPos(), self.MaxRange * 1.25) do
			local class = v:GetClass()
			
			if (class == "info_player_deathmatch" or class == "info_player_rebel" or class == "info_player_combine" or class == "gmod_player_start" or class == "info_player_start" or class == "info_player_allies" or class == "info_player_axis" or class == "info_player_counterterrorist" or class == "info_player_terrorist") then
				nearesttarg = self
				return
			end
			
			local isally = false
			if (v:IsPlayer() and owner ~= v) then
				if self:GetOwner():IsAllied(v) then
					isally = true
				end
			end
			local istarget = false
			if (v:GetName():lower():find(self.Body:GetNWString("enemytarget"):lower()) and self.Body:GetNWString("enemytarget") ~= "") then
				istarget = true
			end
			
			local hate = self.Body:GetNWBool("hatetarget")
			local isplayer = v:IsPlayer()
			local valid = ((((not isplayer or not isally or istarget) and not hate) or (not isplayer or (istarget and hate))) and ((isplayer and owner ~= v)))
			
			if valid then
				local tracerun = false
				local traceshit = {}
					traceshit.start = self:GetPos()
					traceshit.endpos = v:GetPos()
					traceshit.filter = { self.Body, v, self }
				traceshit = util.TraceLine(traceshit)
				
				if (IsValid(traceshit.Entity) and not traceshit.HitWorld) then
					if (traceshit.Entity:GetVar("PropProtection")) then
						local entowner = player.GetByUniqueID(traceshit.Entity:GetVar("PropProtection"))
						if (entowner == v) then tracerun = true end
					elseif (traceshit.Fraction == 1) then
						tracerun=true
					end
				elseif (!traceshit.HitWorld) then
					tracerun = true
				end
				
				local tracehrun = false
				local traceshith = {}
					traceshith.start = self:GetPos()
					traceshith.endpos = v:GetPos() + Vector(0, 0, 30)
					traceshith.filter = {self.Body, v, self}
					
				traceshith = util.TraceLine(traceshith)
				
				if (IsValid(traceshith.Entity) and not traceshith.HitWorld) then
					if (traceshith.Entity:GetVar("PropProtection")) then
						local entowner = player.GetByUniqueID(traceshith.Entity:GetVar("PropProtection"))
						if (entowner == v) then 
							tracehrun = true
						end
					elseif (traceshith.Fraction == 1) then 
						tracehrun = true
					end
				elseif (!traceshith.HitWorld) then
					tracehrun = true
				end
				
				local tracebrun = false
				local traceshitb = {}
					traceshitb.start = self.Body:GetPos()+Vector(0,0,5)
					traceshitb.endpos = v:GetPos()
					traceshitb.filter = { self.Body, v, self }
					-- traceshitb.mask = COLLISION_GROUP_PLAYER
				traceshitb = util.TraceLine(traceshitb)
				if (IsValid(traceshitb.Entity) and !traceshitb.HitWorld) then
					if (traceshitb.Entity:GetVar("PropProtection")!=false) then
						local entowner = player.GetByUniqueID(traceshitb.Entity:GetVar("PropProtection"))
						if (entowner==v) then tracebrun=true end
					elseif (traceshitb.Fraction==1) then tracebrun=true end
				elseif (!traceshitb.HitWorld) then  tracebrun = true end
				
				local tracebhrun = false
				local traceshitbh = {}
					traceshitbh.start = self.Body:GetPos()+Vector(0,0,5)
					traceshitbh.endpos = v:GetPos()+Vector(0, 0, 30)
					traceshitbh.filter = { self.Body, v, self }
					-- traceshitbh.mask = COLLISION_GROUP_PLAYER
				traceshitbh = util.TraceLine(traceshitbh)
				if (IsValid(traceshitbh.Entity) and !traceshitbh.HitWorld) then
					if (traceshitbh.Entity:GetVar("PropProtection")!=false) then
						local entowner = player.GetByUniqueID(traceshitbh.Entity:GetVar("PropProtection"))
						if (entowner==v) then tracebhrun=true end
					elseif (traceshitbh.Fraction==1) then tracebhrun=true end
				elseif (!traceshitbh.HitWorld) then  tracebhrun = true end
				
					local tracewrun = false
				local traceshitw = {}
					traceshitw.start = self:GetPos()
					traceshitw.endpos = v:GetPos()
					traceshitw.filter = { self.Body, v, self }
					traceshitw.mask = COLLISION_GROUP_PLAYER
				traceshitw = util.TraceLine(traceshitw)
				if (!traceshitw.HitWorld) then
					tracewrun=true
				end
				
				local tracewhrun = false
				local traceshitwh = {}
					traceshitwh.start = self:GetPos()
					traceshitwh.endpos = v:GetPos()
					traceshitwh.filter = { self.Body, v, self }
					traceshitwh.mask = COLLISION_GROUP_PLAYER
				traceshitwh = util.TraceLine(traceshitwh)
				if (!traceshitwh.HitWorld) then
					tracewhrun=true
				end
				
				-- if the targeted jackass tries to block the turret, shoot them anyway, otherwise dont.
				if ( ( self:GetPos():Distance(v:GetPos()) < self:GetPos():Distance(nearesttarg:GetPos()) and (tracerun==true or tracehrun==true) and (tracebrun==true or tracebhrun==true)  and (tracewrun==true or tracewhrun==true) and v:Health()>0) or nearesttarg == self and (tracerun==true or tracehrun==true) and (tracebrun==true or tracebhrun==true)  and (tracewrun==true or tracewhrun==true) and v:Health()>0) then
					nearesttarg = v
				end
			end
		end
		-- the very thing the turret is trying to kill.
		if (nearesttarg == self) then
			self.SawShit = 0
		else
			local enemy = nearesttarg
			if( self.Firing ) then
				if (self.SawShit>=2) then
					self:FireShot(enemy)
				else
					self.SawShit = self.SawShit + 1
					self:EmitSound("buttons/blip2.wav")
				end
			end
			
			local pos = self:GetPos()
			local targpos = enemy:GetPos()
			local targdist = pos:Distance(targpos)
			
			if (targdist < self.MaxRange) then
				self.Aimtarg:SetPos(enemy:GetPos() + Vector(0,0,40) )
				self:PointAtEntity(self.Aimtarg)
				
				if (self.SawShit >= 2 or (self.SawShit >= 1 and self.Body:GetLevel() == 2)) then
					self:FireShot(enemy)
				else
					self.SawShit = self.SawShit+1
					self:EmitSound("buttons/blip2.wav")
				end
			end
		end
		
		if (self.BeepTime>=60) then
			self.BeepTime = 0
			self:EmitSound("buttons/blip2.wav")
		elseif (self.Body:GetNWBool("IsActive")) then
			self.BeepTime = self.BeepTime + 1
		end
	else
		self:PointAtEntity(self.Body)
	end
	
	if self.Body:IsPowered() then
		self:NextThink(CurTime() + 0.34)
	else
		-- underpowered turrets only fire/scans once every 2 seconds.
		self:NextThink(CurTime() + 2)
	end
	return true
end
function ENT:OnRemove()
	self.Aimtarg:Remove()
end

function ENT:OnTakeDamage(dmg)
	self.Body:SetNWInt("Health",self.Body:GetNWInt("Health") - dmg:GetDamage())
	if(self.Body:GetNWInt("Health") <= 0) then
		self.Body:Explode()  
		self.Body:Remove()
	end
end
