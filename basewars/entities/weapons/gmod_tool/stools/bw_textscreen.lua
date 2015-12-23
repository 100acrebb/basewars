--easylua.StartTool("bw_textscreen")

	cleanup.Register("bw_textscreen")

	if CLIENT then
		
		language.Add("Tool.bw_textscreen.name", "Textscreens")
		language.Add("Tool.bw_textscreen.desc", "Screens with text on them")
		language.Add("Tool.bw_textscreen.0", "Left Click: Spawns/Updates a textscreen Right Click: Removes a textscreen")
		language.Add("Tool_bw_textscreen_0", "Left Click: Spawns/Updates a textscreen Right Click: Removes a textscreen")
		language.Add("Undone.bw_textscreen", "Undone Textscreen")
		language.Add("Undone_bw_textscreen", "Undone Textscreen")
		language.Add("Cleanup.bw_textscreen", "Textscreens")
		language.Add("Cleanup_bw_textscreen", "Textscreens")
		language.Add("Cleaned.bw_textscreen", "Cleaned up all Textscreens")
		language.Add("Cleaned_bw_textscreen", "Cleaned up all Textscreens")	
		language.Add("SBoxLimit.bw_textscreen", "You've hit the Textscreens limit!")
		language.Add("SBoxLimit_bw_textscreen", "You've hit the Textscreens limit!")

	end

	-- Define these!
	TOOL.Category	= "Construction"	-- Name of the category
	TOOL.Name		= "Textscreens"	-- Name to display
	TOOL.Command	= nil			-- Command on click (nil for default), can be removed
	TOOL.ConfigName	= nil			-- Config file name (nil for default), can be removed
	TOOL.Lines = {

		"font:32",
		"PANIC!",

	}

	TOOL.ClientConVar["lines"] = "Uh oh! I am missing configuration!"

	local function MakeTextScreen(ply, tr, lines)

		local pos = tr.HitPos
		local hn = tr.HitNormal

		pos = pos + hn:Angle():Forward() * 6

		local ang = hn:Angle()

		ang:RotateAroundAxis(hn:Angle():Right(), 180)
		ang:RotateAroundAxis(hn:Angle():Forward(), 90)

		local screen = ents.Create("bw_textscreen")

		screen:SetPos(pos)
		screen:SetAngles(ang)
		screen:SetCollisionGroup(COLLISION_GROUP_WORLD)
		screen:Spawn()
		screen:Activate()
		screen:NetworkLines(lines)

		local phys = screen:GetPhysicsObject()

		if phys:IsValid() then
			
			phys:EnableMotion(false)

		end

		undo.Create("bw_textscreen")
			undo.AddEntity(screen)
			undo.SetPlayer(ply)
		undo.Finish()

		ply:AddCount("bw_textscreen", screen)
		ply:AddCleanup("bw_textscreen", screen)

		return IsValid(screen)

	end

	function TOOL:LeftClick(tr)

		if CLIENT then return true end
		--if not self:GetWeapon():CheckLimit("bw_textscreen") then return false end

		if not tr.Hit then return false end

		local hitEnt = tr.Entity

		if hitEnt:IsPlayer() then return false end

		local ply = self:GetOwner()

		local lines = self:GetClientInfo("lines")
		lines = lines:Split("\\n")

		if #lines == 0 then return false end

		if hitEnt:IsValid() and hitEnt:GetClass() == "bw_textscreen" then
			
			hitEnt:NetworkLines(lines)
			return true

		end	

		return MakeTextScreen(ply, tr, lines)

	end

	function TOOL:RightClick(tr)

		if CLIENT then return true end

		if not tr.Hit then return false end

		local hitEnt = tr.Entity
		local ply = self:GetOwner()

		if hitEnt:IsValid() and hitEnt:GetClass() == "bw_textscreen" and hitEnt:GetOwner() == ply then
			
			hitEnt:Remove()
			return true

		end	

		return false

	end

	function TOOL:Think()

	end

--easylua.EndTool()