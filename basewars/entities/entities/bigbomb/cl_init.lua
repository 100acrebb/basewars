include('shared.lua')

ENT.RenderGroup 		= RENDERGROUP_OPAQUE

function ENT:Draw()
	self:DrawModel()
end

function ENT.Initialize()
	
	killicon.AddFont("bigbomb","CSKillIcons","I",Color(100,100,100,255))
	killicon.AddFont("env_physexplosion","CSKillIcons","I",Color(100,100,100,255))
	killicon.AddFont("bigbomb_fragment","CSKillIcons","I",Color(100,100,100,255))
	util.PrecacheSound("weapons/c4/c4_beep1.wav")
	util.PrecacheSound("weapons/c4/c4_disarm.wav")
	util.PrecacheSound("weapons/c4/c4_explode1.wav")
	util.PrecacheSound("weapons/c4/c4_exp_deb1.wav")
	
---	self.CamAng = Angle(0)
---	self.CamPos = self:LocalToWorld( Vector( 0, 0, 96 ) )
	
end