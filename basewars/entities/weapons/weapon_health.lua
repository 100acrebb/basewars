AddCSLuaFile()

SWEP.PrintName 			= "Healgun"
SWEP.Author 			= "Masterbrian123"
SWEP.Instructions 		= "U can heal people whit that, u don't even need a degree"
SWEP.Purpose 			= "Heals"

SWEP.Spawnable 			= true
SWEP.AdminSpawnable 	= false

SWEP.ViewModelFOV 		= 65
SWEP.ViewModel 			= "models/weapons/v_superphyscannon.mdl"
SWEP.WorldModel 		= "models/weapons/w_physics.mdl"

SWEP.AutoSwitchTo 		= true
SWEP.AutoSwitchFrom 	= false

SWEP.Slot 				= 5
SWEP.SlotPos 			= 1

SWEP.HoldType 			= "smg"
SWEP.FiresUnderwater 	= true
SWEP.Weight 			= 20
SWEP.DrawCrosshair 		= true
SWEP.Category 			= "Masterbrian123 swep"
SWEP.DrawAmmo 			= false
SWEP.Base 				= "weapon_base"

SWEP.HealAmount 		= 3
SWEP.Primary.Damage     = 0
SWEP.Primary.ClipSize 	= -1                          
SWEP.Primary.Ammo 		= "none"                       
SWEP.Primary.DefaultClip = -1                       
SWEP.Primary.Spread 	= 0.25                          
SWEP.Primary.NumberofShots = 1                      
SWEP.Primary.Automatic 	= true            
SWEP.Primary.Recoil 	= 0.01                             
SWEP.Primary.Delay 		= 0.08                           
SWEP.Primary.Force 		= 1
 
SWEP.Secondary.ClipSize 	= -1 
SWEP.Secondary.DefaultClip 	= -1 
SWEP.Secondary.Automatic 	= true 
SWEP.Secondary.Ammo 		= "none"


function SWEP:Think()
end

function SWEP:Initialize()
	util.PrecacheSound( "smallmedkit1.wav" )
        self:SetWeaponHoldType( self.HoldType )
		
end


function SWEP:PrimaryAttack()
	if not IsFirstTimePredicted() then return end
	local tr = util.TraceLine({
		start = self.Owner:GetShootPos(),
		endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * 99999999,
		filter = self.Owner
	})

	local ent = tr.Entity
	if ( IsValid( ent ) && ( ent:IsPlayer() ) ) then
		if ent:Health() == ent:GetMaxHealth() then return end
		
		local bullet = {} 
			bullet.Num = self.Primary.NumberofShots 
			bullet.Src = self.Owner:GetShootPos() 
			bullet.Dir = self.Owner:GetAimVector() 
			bullet.Spread = self.Primary.Spread
			bullet.Tracer = 1
			bullet.TracerName = "ToolTracer"
			bullet.Force = self.Primary.Force 
			bullet.Damage = self.Primary.Damage 
			bullet.AmmoType = self.Primary.Ammo
		self.Owner:FireBullets(bullet) 
	
		ent:SetHealth( math.min( ent:GetMaxHealth(), ent:Health() + self.HealAmount ) )
		self.Owner:EmitSound("items/smallmedkit1.wav", 60, ent:Health())
	end	
	
    self.Weapon:SetNextPrimaryFire( CurTime() + self.Primary.Delay ) 
    self.Weapon:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
end
	

function SWEP:SecondaryAttack()
end
