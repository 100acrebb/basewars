MODULE.Name 	= "NPCs"
MODULE.Author 	= "Q2F2 & Ghosty"

local tag = "BaseWars.NPCs"
local PLAYER = debug.getregistry().Player

local function Curry(f)

	local MODULE = MODULE
	local function curriedFunction(...)
		return f(MODULE, ...)
	end

	return curriedFunction

end

if CLIENT then

	surface.CreateFont(tag, {
		font = "Segoe UI",
		size = 72,
		weight = 1200,
	})

	function MODULE:Draw()
	
		local me = LocalPlayer()
		if not me then return end
		
		local Pos = me:GetPos()
		
		for k, v in next, ents.FindByClass("bw_*") do
		
			if not BaseWars.Ents:Valid(v) or not v.IsBWNPC then continue end
			
			local Ang = v:GetAngles()

			Ang:RotateAroundAxis(Ang:Forward(), 90)
			Ang:RotateAroundAxis(Ang:Right(), -90)
			
			local Tall = v:OBBMaxs()
			Tall.y = 0
			Tall.x = 0
			
			local Pos2 = v:GetPos()
			
			local Col = v.TextColor
			Col.a = BaseWars.Config.NPC.FadeOut - Pos:Distance(Pos2)
			
			if Col.a < 1 then continue end

			cam.Start3D2D(Pos2 + Tall - v:GetUp(), Ang, 0.095)
			
				draw.SimpleTextOutlined(v.PrintName, tag, 0, 0, Col, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 0.85, color_black)	
				
			cam.End3D2D()
			
		end

	end
	hook.Add("PostDrawTranslucentRenderables", tag, Curry(MODULE.Draw))
	

return end

util.AddNetworkString("BaseWars.NPCs.Menu")

function MODULE:CreateNPC(type)



end
