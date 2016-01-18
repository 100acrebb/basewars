MODULE.Name 	= "NPCs"
MODULE.Author 	= "Q2F2 & Ghosty"

--for k, v in next, ents.FindByClass"bw_npc" do print("[" .. k .. "] = {") local a = v:GetAngles() local p = v:GetPos() local r = math.Round print("\tPos = Vector(" .. r(p.x) .. ", " .. r(p.y) .. ", " .. r(p.z) .. "),") print("\tAng = Angle(" .. r(a.p) .. ", " .. r(a.y) .. ", " .. r(a.r) .. "),")  print("},\n") end

MODULE.MapTable = {
	
	["basewars_bangclaw_v1"] = {
	
		[1] = {
		
			-- 0x2c272b38
			Pos = Vector(-1006, -1441, 74),
			-- 0x2c272b60
			Ang = Angle(0, 135, 0),
			
		},
	
	},
	
	["rp_bangclaw"] = {
	
		[1] = {
			Pos = Vector(-1006, -1441, 75),
			Ang = Angle(0, 135, 0),
		},
		
		[2] = {
			Pos = Vector(2055, -2289, 75),
			Ang = Angle(0, 141, 0),
		},
		
		[3] = {
			Pos = Vector(1315, 2129, 147),
			Ang = Angle(0, -133, 0),
		},
		
		[4] = {
			Pos = Vector(3619, 364, 75),
			Ang = Angle(0, -145, 0),
		},
		
		[5] = {
			Pos = Vector(51, -1924, 75),
			Ang = Angle(0, -141, 0),
		},
		
		[6] = {
			Pos = Vector(712, -90, 74),
			Ang = Angle(0, 87, 0),
		},
	
	},

}

local tag = "BaseWars.NPCs"
local PLAYER = debug.getregistry().Player

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

			cam.Start3D2D(Pos2 + Tall + v:GetUp() * 8, Ang, 0.095)
			
				draw.SimpleTextOutlined(v.PrintName, tag, 0, 0, Col, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 0.85, color_black)	
				
			cam.End3D2D()
			
		end

	end
	hook.Add("PostDrawTranslucentRenderables", tag, Curry(MODULE.Draw))
	

return end

util.AddNetworkString("BaseWars.NPCs.Menu")

function MODULE:CreateNPCs()

	local Map = game.GetMap()
	local Entry = BaseWars.NPCs.MapTable[Map]
	
	if not Entry then return end
	
	for k, v in next, Entry do
	
		local Ent = ents.Create(v.Class or "bw_npc")
			if not BaseWars.Ents:Valid(Ent) then continue end
			
			Ent:SetPos(v.Pos)
			Ent:SetAngles(v.Ang)
			
		Ent:Spawn()
		Ent:Activate()
		
	end

end
hook.Add("InitPostEntity", tag .. ".CreateNPCs", Curry(MODULE.CreateNPCs))
