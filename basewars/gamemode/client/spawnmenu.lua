
local SpawnList = {}

local function M(model, price, ent)
	return {

		Model = model,
		Price = price or 0,
		ClassName = ent,

	}
end

local function M2(model, price, ent)
	return {

		Model = model,
		Price = price or 0,
		ClassName = ent,
		ShouldFreeze = true,

	}
end

BaseWars.SpawnList = SpawnList
SpawnList.Models = {

	Barricades = {

		["Fences and Doors"] = {
			["Barred door"] 		= M2"models/props_building_details/Storefront_Template001a_Bars.mdl",
			["Long fence a"] 		= M2"models/props_c17/fence01a.mdl",
			["Short fence a"] 		= M2"models/props_c17/fence01b.mdl",
			["Long fence b"] 		= M2"models/props_c17/fence02a.mdl",
			["Short fence b"] 		= M2"models/props_c17/fence02b.mdl",
			["Long fence c"]		= M2"models/props_c17/fence03a.mdl",
			["Long fence d"]		= M2"models/props_wasteland/interior_fence002d.mdl",
			["Bent fence"] 			= M2"models/props_c17/fence04a.mdl",
			["Gate door"] 			= M2"models/props_c17/gate_door01a.mdl",
			["Long gate door"] 		= M2"models/props_c17/gate_door02a.mdl",
			["Elevator door"]		= M2"models/props_interiors/ElevatorShaft_Door01a.mdl",
			["Fence door"]			= M2"models/props_wasteland/interior_fence001g.mdl",
			["Fence door open"] 	= M2"models/props_wasteland/interior_fence002e.mdl",
			["Prison door"]			= M2"models/props_wasteland/prison_celldoor001b.mdl",
		},

		Barriers = {
			["Concrete barrier"] 	= M2"models/props_c17/concrete_barrier001a.mdl",
			["Metal"] 				= M2"models/props_debris/metal_panel01a.mdl",
			["Long metal"]			= M2"models/props_debris/metal_panel02a.mdl",
			["Blast door a"]		= M2"models/props_lab/blastdoor001a.mdl",
			["Blast door b"] 		= M2"models/props_lab/blastdoor001b.mdl",
			["Double blast door"]	= M2("models/props_lab/blastdoor001c.mdl", 5),
			["Striped barrier a"] 	= M2("models/props_wasteland/barricade001a.mdl", 10),
			["Striped barrier b"]	= M2("models/props_wasteland/barricade002a.mdl", 10),
			["Train track stopper"] = M2("models/props_trainstation/TrackSign02.mdl", 10),
		}

	},

	Furniture = {

		["Beds and Mattresses"] = {
			["Metal bedframe"]		= M"models/props_c17/FurnitureBed001a.mdl",
			["Prison bedframe"]		= M"models/props_wasteland/prison_bedframe001b.mdl",
			["Mattress"]			= M("models/props_c17/FurnitureMattress001a.mdl",0,"prop_ragdoll"),
		},

		["Chairs and Benches"] = {
			["Park bench"]			= M"models/props_c17/bench01a.mdl",
			["Plastic chair"]		= M"models/props_c17/chair02a.mdl",
			["Wooden chair"]		= M"models/props_c17/FurnitureChair001a.mdl",
			["Plaza chair"]			= M"models/props_interiors/Furniture_chair01a.mdl",
			["Plastic chair"]		= M"models/props_interiors/Furniture_chair03a.mdl",
			["Outdoors bench"]		= M2"models/props_trainstation/BenchOutdoor01a.mdl",
			["Indoors bench"]		= M2"models/props_trainstation/bench_indoor001a.mdl",
			["Cafeteria bench"]		= M"models/props_wasteland/cafeteria_bench001a.mdl",
			["Folding chair"]		= M"models/props_wasteland/controlroom_chair001a.mdl",
			["Office chair"]		= M"models/props_combine/breenchair.mdl",
			["Train station bench"]	= M"models/props_trainstation/traincar_seats001.mdl",
		},

		["Tables, Desks and Storage"] = {
			["Round table"]				= M"models/props_c17/FurnitureTable001a.mdl",
			["Big rectangular table"]	= M"models/props_c17/FurnitureTable002a.mdl",
			["Small rectangular table"]	= M"models/props_c17/FurnitureTable003a.mdl",
			["Vanity"]					= M"models/props_interiors/Furniture_Vanity01a.mdl",
			["Shelf 1"]					= M"models/props_interiors/Furniture_shelf01a.mdl",
			["Shelf 2"]					= M"models/props_c17/shelfunit01a.mdl",
			["Wall shelf"]				= M2"models/props_c17/FurnitureShelf002a.mdl",
			["Desk"]					= M"models/props_interiors/Furniture_Desk01a.mdl",
			["Office desk"]				= M"models/props_combine/breendesk.mdl",

		},

		["Signs"] = {

			["Ravenholm sign"]			= M2"models/props_junk/ravenholmsign.mdl",
			["cF sign"]					= M"models/props_trainstation/TrackSign08.mdl",
			["Nf sign"]					= M"models/props_trainstation/TrackSign09.mdl",
			["Right arrow sign"]		= M"models/props_trainstation/TrackSign10.mdl",
			["Speed limit sign (20)"] 	= M("models/props_c17/streetsign001c.mdl",1),
			["Speed limit sign (30)"] 	= M("models/props_c17/streetsign002b.mdl",1),
			["Train crossing sign"] 	= M("models/props_c17/streetsign003b.mdl",1),
			["Crossed sign"]		 	= M("models/props_c17/streetsign004e.mdl",1),
			["No entry sign"]			= M("models/props_c17/streetsign004f.mdl",1),
			["Zebra crossing sign"]		= M("models/props_c17/streetsign005b.mdl",1),
			["Tire warning sign"]		= M("models/props_c17/streetsign005c.mdl",1),
			["Rockfall warning sign"]	= M("models/props_c17/streetsign005d.mdl",1),
			["Signpole"]				= M2("models/props_c17/signpole001.mdl",0),

		},

		["Vegetation"] = {

			["Cheap potted plant"]		= M"models/props/cs_office/plant01.mdl",
			["Old potted plant"]		= M("models/props/de_inferno/claypot03.mdl",1),
			["Big potted plant"]		= M("models/props/de_inferno/pot_big.mdl",1),
			["Flower barrel"]			= M("models/props/de_inferno/flower_barrel.mdl",1),
			["Potted plant a"]			= M("models/props/de_inferno/potted_plant1.mdl",1),
			["Potted plant b"]			= M("models/props/de_inferno/potted_plant2.mdl",1),
			["Potted plant c"]			= M("models/props/de_inferno/potted_plant3.mdl",1),

		},

		["Appliances"] = {

			["Washing machine"]			= M2("models/props_c17/FurnitureWashingmachine001a.mdl", 5),
			["Radiator"]				= M2("models/props_interiors/Radiator01a.mdl", 5),
			["Vending machine"]			= M2("models/props_interiors/VendingMachineSoda01a.mdl", 10, "basewars_vendingmachine"),
			["Fridge"]					= M2("models/props_wasteland/kitchen_fridge001a.mdl", 5),
			["Stove"]					= M2("models/props_wasteland/kitchen_stove001a.mdl", 5),
			["Big stove"]				= M2("models/props_wasteland/kitchen_stove002a.mdl", 10),
			["Rusty tumble dryer"]		= M2("models/props_wasteland/laundry_dryer001.mdl", 1),
			["Tumble dryer"]			= M2("models/props_wasteland/laundry_dryer002.mdl", 5),
			["Launderette washer"]		= M2("models/props_wasteland/laundry_washer001a.mdl", 10),
			["Generator"]				= M2("models/props_wasteland/laundry_washer003.mdl", 20),
			["Spotlight"]				= M2("models/props_wasteland/light_spotlight01_lamp.mdl", 5),
			["Prison light"]			= M2("models/props_wasteland/prison_lamp001c.mdl", 1),

		},

	},

	["Build"] = {

		["Plastic"] = {
			-- 1x plates
			["1x1 plate"]			= M"models/hunter/plates/plate1x1.mdl",
			["1x2 plate"]			= M"models/hunter/plates/plate1x2.mdl",
			["1x3 plate"]			= M"models/hunter/plates/plate1x3.mdl",
			["1x4 plate"]			= M"models/hunter/plates/plate1x4.mdl",
			["1x5 plate"]			= M("models/hunter/plates/plate1x5.mdl", 5),
			["1x6 plate"]			= M("models/hunter/plates/plate1x6.mdl", 5),
			["1x7 plate"]			= M("models/hunter/plates/plate1x7.mdl", 5),
			["1x8 plate"]			= M("models/hunter/plates/plate1x8.mdl", 10),

			-- 2x plates
			["2x2 plate"]			= M"models/hunter/plates/plate2x2.mdl",
			["2x3 plate"]			= M"models/hunter/plates/plate2x3.mdl",
			["2x4 plate"]			= M"models/hunter/plates/plate2x4.mdl",
			["2x5 plate"]			= M("models/hunter/plates/plate2x5.mdl", 5),
			["2x6 plate"]			= M("models/hunter/plates/plate2x6.mdl", 5),
			["2x7 plate"]			= M("models/hunter/plates/plate2x7.mdl", 5),
			["2x8 plate"]			= M("models/hunter/plates/plate2x8.mdl", 10),

			-- 3x plates
			["3x3 plate"]			= M"models/hunter/plates/plate3x3.mdl",
			["3x4 plate"]			= M"models/hunter/plates/plate3x4.mdl",
			["3x5 plate"]			= M("models/hunter/plates/plate3x5.mdl", 5),
			["3x6 plate"]			= M("models/hunter/plates/plate3x6.mdl", 5),
			["3x7 plate"]			= M("models/hunter/plates/plate3x7.mdl", 5),
			["3x8 plate"]			= M("models/hunter/plates/plate3x8.mdl", 10),

			-- 4x plates
			["4x4 plate"]			= M"models/hunter/plates/plate4x4.mdl",
			["4x5 plate"]			= M("models/hunter/plates/plate4x5.mdl", 5),
			["4x6 plate"]			= M("models/hunter/plates/plate4x6.mdl", 5),
			["4x7 plate"]			= M("models/hunter/plates/plate4x7.mdl", 5),
			["4x8 plate"]			= M("models/hunter/plates/plate4x8.mdl", 10),

			-- 5x plates
			["5x5 plate"]			= M("models/hunter/plates/plate5x5.mdl", 5),
			["5x6 plate"]			= M("models/hunter/plates/plate5x6.mdl", 5),
			["5x7 plate"]			= M("models/hunter/plates/plate5x7.mdl", 5),
			["5x8 plate"]			= M("models/hunter/plates/plate5x8.mdl", 10),

			-- 6x plates
			["6x6 plate"]			= M("models/hunter/plates/plate6x6.mdl", 5),
			["6x7 plate"]			= M("models/hunter/plates/plate6x7.mdl", 5),
			["6x8 plate"]			= M("models/hunter/plates/plate6x8.mdl", 10),

			-- 7x plates
			["7x7 plate"]			= M("models/hunter/plates/plate7x7.mdl", 5),
			["7x8 plate"]			= M("models/hunter/plates/plate7x8.mdl", 10),

			["8x8 plate"]			= M("models/hunter/plates/plate8x8.mdl", 15),

		},

		["Wood"] = {

			["Short plank"]			= M"models/props_phx/construct/wood/wood_boardx1.mdl",
			["Medium plank"]		= M"models/props_phx/construct/wood/wood_boardx2.mdl",
			["Long plank"]			= M"models/props_phx/construct/wood/wood_boardx4.mdl",

			["1x1 panel"]			= M"models/props_phx/construct/wood/wood_panel1x1.mdl",
			["1x2 panel"]			= M"models/props_phx/construct/wood/wood_panel1x2.mdl",
			["2x2 panel"]			= M"models/props_phx/construct/wood/wood_panel2x2.mdl",
			["2x4 panel"]			= M"models/props_phx/construct/wood/wood_panel2x4.mdl",

			["1x1 rectangle"]		= M"models/props_phx/construct/wood/wood_wire1x1.mdl",
			["1x1x1 cube"]			= M"models/props_phx/construct/wood/wood_wire1x1x1.mdl",
			["1x1x2 cube a"]		= M"models/props_phx/construct/wood/wood_wire1x1x2.mdl",
			["1x1x2 cube b"]		= M"models/props_phx/construct/wood/wood_wire1x1x2b.mdl",
			["1x2 rectangle a"]		= M"models/props_phx/construct/wood/wood_wire1x2.mdl",
			["1x2 rectangle b"]		= M"models/props_phx/construct/wood/wood_wire1x2b.mdl",
			["1x2x2 cube"]			= M"models/props_phx/construct/wood/wood_wire1x2x2b.mdl",
			["2x2 rectangle a"]		= M"models/props_phx/construct/wood/wood_wire2x2.mdl",
			["2x2 rectangle b"]		= M"models/props_phx/construct/wood/wood_wire2x2b.mdl",
			["2x2x2 cube"]			= M"models/props_phx/construct/wood/wood_wire2x2x2b.mdl",

		},

		--["Metal"] = {


		--},

	},

	Junk = {

		["Garbage"] = {

			["Pipe"]				= M"models/props_canal/mattpipe.mdl",
			["Pot"]					= M"models/props_interiors/pot02a.mdl",
			["Assorted junk a"]		= M"models/props_junk/garbage128_composite001a.mdl",
			["Assorted junk b"]		= M"models/props_junk/garbage128_composite001b.mdl",
			["Assorted junk c"]		= M"models/props_junk/garbage128_composite001c.mdl",
			["Assorted junk d"]		= M"models/props_junk/garbage128_composite001d.mdl",
			["Assorted junk e"]		= M"models/props_junk/garbage256_composite001a.mdl",
			["Assorted junk f"]		= M"models/props_junk/garbage256_composite001b.mdl",
			["Assorted junk g"]		= M"models/props_junk/garbage256_composite002a.mdl",
			["Assorted junk h"]		= M"models/props_junk/garbage256_composite002b.mdl",
			["Newspaper"]			= M"models/props_junk/garbage_newspaper001a.mdl",
			["Milk carton a"]		= M"models/props_junk/garbage_milkcarton001a.mdl",
			["Milk carton b"]		= M"models/props_junk/garbage_milkcarton002a.mdl",
			["Detergent bottle a"]	= M"models/props_junk/garbage_plasticbottle001a.mdl",
			["Detergent bottle b"]	= M"models/props_junk/garbage_plasticbottle002a.mdl",
			["Juice bottle"]		= M"models/props_junk/garbage_plasticbottle003a.mdl",
			["Leftover chinese"]	= M"models/props_junk/garbage_takeoutcarton001a.mdl",
			["Bottle of beer"]		= M"models/props_junk/GlassBottle01a.mdl",
			["Bottle of rum"]		= M"models/props_junk/glassjug01.mdl",
			["Fishing hook"]		= M"models/props_junk/meathook001a.mdl",
			["Spear"]				= M"models/props_junk/harpoon002a.mdl",
			["Paint can a"]			= M"models/props_junk/metal_paintcan001a.mdl",
			["Paint can b"]			= M"models/props_junk/metal_paintcan001b.mdl",
			["Bucket"]				= M"models/props_junk/MetalBucket01a.mdl",
			["Double bucket"]		= M"models/props_junk/MetalBucket02a.mdl",
			["Plastic container"]	= M"models/props_junk/PlasticCrate01a.mdl",

		},

		["Barrels and Explosives"] = {

			["Barrel"]				= M2("models/props_c17/oildrum001.mdl",100),
			["Explosive barrel"]	= M2("models/props_c17/oildrum001_explosive.mdl",1000),
			["MK-82 bomb"]			= M2("models/props_phx/mk-82.mdl",1000),
			["WW2 bomb"]			= M2("models/props_phx/ww2bomb.mdl",1050),
			["Amraam missile"]		= M2("models/props_phx/amraam.mdl",5000),
			["Torpedo"]				= M2("models/props_phx/torpedo.mdl",5050),

		},

	},

}


if SERVER then 

	local function Spawn(ply, cat, subcat, item)

		local l = SpawnList and SpawnList.Models

		if not l then return end

		if not cat or not item then return end

		local i = l[cat]

		if not i then return end

		i = i[subcat]

		if not i then return end

		i = i[item]

		if not i then return end

		local model, price, ent = i.Model, i.Price, i.ClassName

		local tr = ply:GetEyeTraceNoCursor()

		if not tr.Hit then return end

		if price > 0 then
			
			local plyMoney = ply:GetMoney()

			if plyMoney < price then
				
				BaseWars.Util_Player:Notification(ply, "You don't have enough money for that.", Color(255, 0, 0))

			return end

			ply:SetMoney(plyMoney - price)
			ply:EmitSound("mvm/mvm_money_pickup.wav")

			BaseWars.Util_Player:Notification(ply, "You bought a(n) \"" .. item .. "\" for £" .. price .. ".", Color(0, 255, 0))

		end

		local prop
		local noundo

		if ent then
			
			local newEnt = ents.Create(ent)

			if not newEnt then return end

			undo.Create("something")

			if newEnt.SpawnFunction then 


				newEnt:SetModel(model)
				newEnt:SpawnFunction(ply, tr, ent)

				if newEnt.CPPISetOwner then

					newEnt:CPPISetOwner(ply)
	
				end			

				local phys = newEnt:GetPhysicsObject()

				if IsValid(phys) then

					if i.ShouldFreeze then
					
						phys:EnableMotion(false)

					end

				end			

				undo.AddEntity(newEnt)
				undo.SetPlayer(ply)
				undo.Finish()

			return end

			prop = newEnt

			noundo = true

		end

		local SpawnPos = tr.HitPos + tr.HitNormal * 160
		local SpawnAng = ply:EyeAngles()
		SpawnAng.p = 0
		SpawnAng.y = SpawnAng.y + 180
		SpawnAng.y = math.Round(SpawnAng.y / 45) * 45

		if not prop then prop = ents.Create(ent or "prop_physics") end
		if not noundo then undo.Create("prop") end

		prop:SetPos(SpawnPos)
		prop:SetAngles(SpawnAng)

		if model then

			prop:SetModel(model)

		end

		prop:Spawn()
		prop:Activate()
		prop:DropToFloor()

		local phys = prop:GetPhysicsObject()

		if IsValid(phys) then
			
			if i.ShouldFreeze then

					phys:EnableMotion(false)

			end

		end

		undo.AddEntity(prop)
		undo.SetPlayer(ply)
		undo.Finish()

		if prop.CPPISetOwner then

			prop:CPPISetOwner(ply)

		end

	
	end

	concommand.Add("basewars_spawn",function(ply,_,args)

		if not IsValid(ply) then return end
		Spawn(ply, args[1], args[2], args[3], args[4])

	end)

	local function Disallow_Spawning(ply)

		if not ply:IsAdmin()  then
			
			BaseWars.Util_Player:Notification(ply, "Use the BaseWars spawnlist!", Color(255, 0, 0))
			return false

		end

	end

	hook.Add("PlayerSpawnObject", "BaseWars.Disallow_Spawning",Disallow_Spawning)
	hook.Add("PlayerSpawnSENT", "BaseWars.Disallow_Spawning",Disallow_Spawning)
	hook.Add("PlayerSpawnVehicle", "BaseWars.Disallow_Spawning",Disallow_Spawning)

return end

language.Add("spawnmenu.category.basewars","BaseWars")

local overlayFont = "BaseWars.SpawnList.Overlay"
surface.CreateFont(overlayFont,{

	font = "Roboto",
	size = 16,
	weight = 800,

})

local PANEL = {}

function PANEL:Init()

	self.Panels = {}

end

function PANEL:AddPanel(name,pnl)

	self.Panels[name] = pnl
	
	if not self.CurrentPanel then
		
		pnl:Show()
		self.CurrentPanel = pnl

	else

		pnl:Hide()

	end

end

function PANEL:SwitchTo(name,instant)

	local pnl = self.Panels[name]

	if not pnl then return end

	local oldpnl = self.CurrentPanel

	if pnl == oldpnl then return end

	if oldpnl then
		
		oldpnl:AlphaTo(0, instant and 0 or 0.2, 0, function(_,pnl) pnl:Hide() end)

	end

	pnl:Show()
	pnl:AlphaTo(255, instant and 0 or 0.2, 0, function() end)

	self.CurrentPanel = pnl

end

vgui.Register("BaseWars.PanelCollection", PANEL, "Panel")

local PANEL = {}

local white = Color(255, 255, 255)
local gray = Color(192, 192, 192)
local black = Color(0, 0, 0)
local errorcolor = Color(255, 100, 100)
local highlight = Color(100, 100, 100, 200)

function PANEL:CheckError()

	return false

end

function PANEL:Paint(w, h)

	draw.RoundedBox(4, 0, 0, w, h, black)
	draw.RoundedBox(4, 1, 1, w - 2, h - 2, self:CheckError() and errorcolor or white)

	self:DrawTextEntryText(black, highlight, gray)

	return false

end

vgui.Register("BaseWars.ErrorCheckTextEntry", PANEL, "DTextEntry")

local white = Color(255, 255, 255)

local canBuy  = Color(90, 200, 0, 180)
local cantBuy = Color(100, 100, 100, 180)

local shade = Color(0, 0, 0, 200)

local SpawnList = BaseWars.SpawnList

if not SpawnList then return end

local Models = SpawnList.Models

local function MakeTab(type)
	return function(pnl)

		local cats = pnl:Add("DCategoryList")

		cats:Dock(FILL)

		function cats:Paint() end
		
		for catName, subT in SortedPairs(Models[type]) do

			local cat = cats:Add(catName)

			local iLayout = vgui.Create("DIconLayout")

			iLayout:Dock(FILL)

			iLayout:SetSpaceX(4)
			iLayout:SetSpaceY(4)

			for name, tab in SortedPairs(subT) do

				local model = tab.Model
				local money = tab.Price
				
				local icon = iLayout:Add("SpawnIcon")

				icon:SetModel(model)
				icon:SetTooltip(name .. (money > 0 and " (£" .. money .. ")" or ""))

				icon:SetSize(64, 64)

				function icon:DoClick()

					local myMoney = LocalPlayer():GetMoney()

					surface.PlaySound("ui/buttonclickrelease.wav")

					local a1, a2, a3 = type, catName, name

					local function DoIt()

						RunConsoleCommand("basewars_spawn", type, catName, name)

					end

					if money > 0 then

						if myMoney < money then
							
							Derma_Message("You do not have enough money.","Error")

						return end
						
						Derma_Query("Are you sure you want to by a(n) \"" .. name .. "\" for £" .. money .. "?",
							"Purchase confirmation","   Yes   ",DoIt,"   No   ")

					else

						DoIt()

					end
					

				end

				if money > 0 then

						function icon:Paint(w, h)
								
							local myMoney = LocalPlayer():GetMoney()

							draw.RoundedBox(4, 1, 1, w - 2, h - 2, myMoney >= money and canBuy or cantBuy)

						end

						local pO = icon.PaintOver

						function icon:PaintOver(w, h)

							pO(self, w, h)

							local text = "£" .. money

							draw.DrawText(text, overlayFont, w - 2, h - 14, shade, TEXT_ALIGN_RIGHT)
							draw.DrawText(text, overlayFont, w - 4, h - 16, white, TEXT_ALIGN_RIGHT)					

						end

					end

			end

			cat:SetContents(iLayout)
			cat:SetExpanded(true)

		end

	end

end

local Panels = {

	Default = function(pnl)

		local lbl = pnl:Add("ContentHeader")

		lbl:SetPos(16, 0)

		lbl:SetText("BaseWars Spawnlist")

		local lbl = pnl:Add("DLabel")

		lbl:SetPos(16, 64)

		lbl:SetFont("DermaLarge")
		lbl:SetText("Click on a category to the left.")	

		lbl:SetBright(true)

		lbl:SizeToContents()

	end,	

	Barricades = MakeTab("Barricades"),

	Furniture = MakeTab("Furniture"),

	Build = MakeTab("Build"),

	Junk = MakeTab("Junk"),

	Factions = function(pnl)

		local lbl = pnl:Add("ContentHeader")

		lbl:SetPos(16, 0)

		lbl:SetText("Factions")

		local cats = pnl:Add("DCategoryList")

		cats:Dock(TOP)
		cats:DockMargin(0, 68, 0, 0)
		cats:SetTall(200)

		function cats:Think()

			local w,h = self:GetSize()
			self:SizeToContents()
			local _,h2 = self:GetSize()

			self:SetSize(w, h2)
			self:SetTall(h2)

		end

		do -- Create faction

			local cat = cats:Add("Create faction")

			local function make()

				local cont = vgui.Create("DListLayout")
				cont:Dock(FILL)
				cont:DockPadding(8, 8, 8, 8)

				local fnLabel = cont:Add("DLabel")

				fnLabel:SetDark(true)
				fnLabel:SetText("Faction name")
				fnLabel:SizeToContents()

				local fnTEntry = cont:Add("BaseWars.ErrorCheckTextEntry")

				function fnTEntry:OnChange()

					local text = self:GetValue()

					if not text then return end

					local errored = false

					text = text:Trim()

					if #text <= 3 or #text > 20 then errored = true end
					if text == "" then errored = false end

					self.Erroring = errored

				end

				function fnTEntry:CheckError()

					return self.Erroring

				end

				local pwLabel = cont:Add("DLabel")

				pwLabel:SetDark(true)
				pwLabel:SetText("Password (optional)")
				pwLabel:SizeToContents()

				local pwTEntry = cont:Add("BaseWars.ErrorCheckTextEntry")

				pwTEntry.OnChange = fnTEntry.OnChange

				function pwTEntry:CheckError()

					return self.Erroring

				end

				local buttonpar = cont:Add("DPanel")
				buttonpar:SetTall(24)

				function buttonpar:Paint() end

				local OKButton = buttonpar:Add("DButton")

				OKButton:SetSize(64, 24)
				OKButton:SetText("Create")

				function OKButton:DoClick()

					if fnTEntry:CheckError() or pwTEntry:CheckError() then return end

					local name, pw = fnTEntry:GetValue():Trim(), pwTEntry:GetValue():Trim()

					if #pw == 0 then pw = nil end

					LocalPlayer():CreateFaction(name, pw)

					fnTEntry:SetValue("")
					pwTEntry:SetValue("")

					LocalPlayer():Notify("Attempting to create faction \"" .. name .. "\" Password: " .. (pw and ("\"" .. pw .. "\"" ) or "no"), 
					Color(0, 255, 0))

				end

				function OKButton:Think()

					if fnTEntry:CheckError() or pwTEntry:CheckError() then self:SetDisabled(true) return else self:SetDisabled(false) end

					local name, pw = fnTEntry:GetValue():Trim(), pwTEntry:GetValue():Trim()

					if name == "" then self:SetDisabled(true) else self:SetDisabled(false) end

				end

				if cat.Contents then
					cat.Contents:Remove()
					cat.Contents = nil
				end
				cat:SetContents(cont)

			end

			function cat:OnToggle() make() end

			cat:SetExpanded(false)

		end

		do -- Create faction

			local cat = cats:Add("Join faction")

			local function make()

				local cont = vgui.Create("DListLayout")
				cont:Dock(FILL)
				cont:DockPadding(8, 8, 8, 8)

				local fnLabel = cont:Add("DLabel")

				fnLabel:SetDark(true)
				fnLabel:SetText("Faction name")
				fnLabel:SizeToContents()

				local fnTEntry = cont:Add("BaseWars.ErrorCheckTextEntry")

				function fnTEntry:OnChange()

					local text = self:GetValue()

					if not text then return end

					local errored = false

					text = text:Trim()

					if #text <= 3 or #text > 20 then errored = true end
					if text == "" then errored = false end

					self.Erroring = errored

				end

				function fnTEntry:CheckError()

					return self.Erroring

				end

				local pwLabel = cont:Add("DLabel")

				pwLabel:SetDark(true)
				pwLabel:SetText("Password (optional)")
				pwLabel:SizeToContents()

				local pwTEntry = cont:Add("BaseWars.ErrorCheckTextEntry")

				pwTEntry.OnChange = fnTEntry.OnChange

				function pwTEntry:CheckError()

					return self.Erroring

				end

				local buttonpar = cont:Add("DPanel")
				buttonpar:SetTall(24)

				function buttonpar:Paint() end

				local OKButton = buttonpar:Add("DButton")

				OKButton:SetSize(64, 24)
				OKButton:SetText("Join")

				function OKButton:DoClick()

					if fnTEntry:CheckError() or pwTEntry:CheckError() then return end

					local name, pw = fnTEntry:GetValue():Trim(), pwTEntry:GetValue():Trim()

					LocalPlayer():JoinFaction(name, pw)

					fnTEntry:SetValue("")
					pwTEntry:SetValue("")

				end

				function OKButton:Think()

					if fnTEntry:CheckError() or pwTEntry:CheckError() then self:SetDisabled(true) return else self:SetDisabled(false) end

					local name, pw = fnTEntry:GetValue():Trim(), pwTEntry:GetValue():Trim()

					if name == "" then self:SetDisabled(true) else self:SetDisabled(false) end

				end

				if cat.Contents then
					cat.Contents:Remove()
					cat.Contents = nil
				end
				cat:SetContents(cont)

			end

			function cat:OnToggle() make() end

			make()

			cat:SetExpanded(true)

		end

		do -- Leave faction

			local cat = cats:Add("Leave faction")

			local function make()

				local cont = vgui.Create("DListLayout")
				cont:Dock(FILL)
				cont:DockPadding(8, 8, 8, 8)

				local fnLabel = cont:Add("DLabel")

				fnLabel:SetDark(true)
				function fnLabel:Think()
					local fac = LocalPlayer():GetFaction()
					self:SetText("Your faction: " .. (#fac > 0 and fac or " (NONE)"))
				end
				fnLabel:SizeToContents()

				local pwLabel = cont:Add("DLabel")

				pwLabel:SetDark(true)
				function pwLabel:Think()
					local fac = LocalPlayer():GetFaction()
					self:SetText(#fac > 0 and "Are you sure you want to leave your faction?\nIf you are the owner of it, you will disband it." or "You don't have a faction yet!")
					self:SizeToContents()
				end
				

				local buttonpar = cont:Add("DPanel")

				buttonpar:SetTall(24)

				function buttonpar:Paint() end

				local OKButton = buttonpar:Add("DButton")

				OKButton:SetSize(64, 24)
				OKButton:SetText("Leave")

				function OKButton:DoClick()

					local fac = LocalPlayer():GetFaction()
					if #fac == 0 then return end

					LocalPlayer():LeaveFaction(true)

				end

				function OKButton:Think()

					local fac = LocalPlayer():GetFaction()
					if #fac == 0 then self:SetDisabled(true) return else self:SetDisabled(false) end

				end

				if cat.Contents then
					cat.Contents:Remove()
					cat.Contents = nil
				end
				cat:SetContents(cont)

			end

			function cat:OnToggle() make() end

			cat:SetExpanded(false)

		end	

	end,

}

local Tabs = {

	barricades = {
		Name = "Barricades", 
		AssociatedPanel = "Barricades",
		Icon = "icon16/shield.png",
	},

	furniture = {
		Name = "Furniture and Decor", 
		AssociatedPanel = "Furniture",
		Icon = "icon16/lorry.png",
	},

	build = {
		Name = "Build", 
		AssociatedPanel = "Build",
		Icon = "icon16/wrench.png",
	},

	junk = {
		Name = "Junk",
		AssociatedPanel = "Junk",
		Icon = "icon16/bin_closed.png",
	}

}

local function MakeSpawnList()

	local pnl = vgui.Create("DPanel")

	function pnl:Paint(w,h) end

	local leftPanel = pnl:Add("DPanel")

	leftPanel:Dock(LEFT)
	leftPanel:SetWide(256 - 64)
	leftPanel:DockPadding(1, 1, 1, 1)

	local tree = leftPanel:Add("DTree")

	function tree:Paint() end

	tree:Dock(FILL)

	local rightPanel = pnl:Add("BaseWars.PanelCollection")

	rightPanel:Dock(FILL)

	rightPanel:SetMouseInputEnabled(true)
	rightPanel:SetKeyboardInputEnabled(true)

	local defaultNode = tree:AddNode("Spawnlist")

	function defaultNode:OnNodeSelected()

		rightPanel:SwitchTo("Default")

	end

	defaultNode:SetIcon("icon16/application_view_tile.png")

	defaultNode:SetExpanded(true, true)

	defaultNode:GetRoot():SetSelectedItem(defaultNode)

	for _, build in SortedPairs(Tabs) do
		
		local node = defaultNode:AddNode(build.Name or "(UNNAMED)")

		node:SetIcon(build.Icon or "icon16/cancel.png")

		local ap = build.AssociatedPanel
		if ap then

			function node:OnNodeSelected()

				rightPanel:SwitchTo(ap)

			end

		end

	end

	local factionNode = tree:AddNode("Factions")

	factionNode:SetIcon("icon16/shape_handles.png")

	function factionNode:OnNodeSelected()

		rightPanel:SwitchTo("Factions")

	end

	local raidsNode = tree:AddNode("Raids")

	raidsNode:SetIcon("icon16/gun.png")

	local entitiesNode = tree:AddNode("Entities")

	entitiesNode:SetIcon("icon16/bricks.png")	


	for name, build in next, Panels do
		
		local container = rightPanel:Add("DPanel")

		function container:Paint() end

		container:Dock(FILL)

		pcall(build, container)

		rightPanel:AddPanel(name,container)

	end

	rightPanel:SwitchTo("Default", true)

	return pnl

end

spawnmenu.AddCreationTab("#spawnmenu.category.basewars", MakeSpawnList, "icon16/building.png", -100)

RunConsoleCommand("spawnmenu_reload")
