--JUST DONT EDIT THIS WITH REASON FOR STYLING PLEASE.
LookEnt = {}

LookEnt.Key = Material( "custom/key.png" )
LookEnt.Dist = 150

LookEnt.ConVarName = "interactions_enabled"
LookEnt.ConVar = CreateConVar( LookEnt.ConVarName, 1, FCVAR_ARCHIVE, "Enable the indicators for entities? 1 = Enabled, 0 = Disabled" )

LookEnt.Ents = {}

surface.CreateFont("LookEnt.Key", {
	font = "Roboto",
	size = 28,
	weight = 800,
})

surface.CreateFont("LookEnt.Text", {
	font = "Roboto",
	size = 24,
	weight = 400,
})

function LookEnt:RegisterEnt( class, key, action, color )
	key = string.upper( key )
	table.insert( LookEnt.Ents, {class=class, key=key, action=action, color=color} )
end

local me = LocalPlayer()

function LookEnt:Paint()
	if not IsValid( me ) then me = LocalPlayer() end
	if not tobool(LookEnt.ConVar:GetInt()) then return end
	local aimEnt = me:GetEyeTrace().Entity
	if aimEnt:GetClass() == "worldspawn" then return end
	for _, tbl, next in pairs( LookEnt.Ents ) do
		local class = tbl.class
		
		if type( class ) == "string" then
			if aimEnt:GetClass() ~= class then continue end	
		else
			if not class(aimEnt) then continue end
		end
		
		if aimEnt:GetPos():Distance( me:GetPos() ) > LookEnt.Dist then continue end
		
		local key = tbl.key
		local action, name = tbl.action( aimEnt )
		local actioncolor, namecolor = tbl.color( aimEnt )
		
		local sW = ScrW()
		local sH = ScrH()
		
		surface.SetFont( "LookEnt.Key" )
		local keyX, keyY = surface.GetTextSize( key )
		
		surface.SetFont( "LookEnt.Text" )
		local actionX, actionY = surface.GetTextSize( action )
		
		surface.SetFont( "LookEnt.Text" )
		local nameX, nameY = surface.GetTextSize( name )
		
		surface.SetMaterial( LookEnt.Key )
		surface.SetDrawColor( Color( 255, 255, 255 ) )
		surface.DrawTexturedRect( sW / 2 - actionX - nameX / 2 - keyX + 15, sH / 2 + 40 / 2, 40, 40 )
		
		surface.SetFont( "LookEnt.Key" )
		surface.SetTextColor( Color( 0, 0, 0 ) )
		surface.SetTextPos( sW / 2 - actionX - nameX / 2 + 15 + 1, sH / 2 + 40 / 2 + 40 / 2 - keyY / 2 + 1 )
		surface.DrawText( key )
		
		surface.SetFont( "LookEnt.Key" )
		surface.SetTextColor( Color( 0, 0, 0 ) )
		surface.SetTextPos( sW / 2 - actionX - nameX / 2 + 15, sH / 2 + 40 / 2 + 40 / 2 - keyY / 2 )
		surface.DrawText( key )
		
		surface.SetFont( "LookEnt.Text" )
		surface.SetTextColor( Color( 0, 0, 0 ) )
		surface.SetTextPos( sW / 2 - actionX - nameX / 2 + 40 + 10 + 1, sH / 2 + 40 / 2 + 40 / 2 - actionY / 2 + 1 )
		surface.DrawText( action )
		
		surface.SetFont( "LookEnt.Text" )
		surface.SetTextColor( actioncolor )
		surface.SetTextPos( sW / 2 - actionX - nameX / 2 + 40 + 10, sH / 2 + 40 / 2 + 40 / 2 - actionY / 2 )
		surface.DrawText( action )
		
		surface.SetFont( "LookEnt.Text" )
		surface.SetTextColor( Color( 0, 0, 0 ) )
		surface.SetTextPos( sW / 2 - actionX - nameX / 2 + 40 + 10 + actionX + 5 + 1, sH / 2 + 40 / 2 + 40 / 2 - actionY / 2 + 1 )
		surface.DrawText( name )
		
		surface.SetFont( "LookEnt.Text" )
		surface.SetTextColor( namecolor )
		surface.SetTextPos( sW / 2 - actionX - nameX / 2 + 40 + 10 + actionX + 5, sH / 2 + 40 / 2 + 40 / 2 - actionY / 2 )
		surface.DrawText( name )
	end
end

hook.Add( "HUDPaint", "LookEnt.Paint", LookEnt.Paint )

--The awfull part down here
LookEnt:RegisterEnt( "prop_door_rotating", input.LookupBinding( "+use" ), function( aimEnt )
	return "Use", "door"
end, 
function( aimEnt )
	return Color( 128, 255, 0 ), Color( 255, 255, 21 )
end )

LookEnt:RegisterEnt( function( aimEnt ) return aimEnt.IsPrinter end, input.LookupBinding( "+use" ), function( aimEnt )
	return "Collect", "money"
end, 
function( aimEnt )
	return ((aimEnt:GetMoney() > 0) and Color( 128, 255, 0 )) or Color( 255, 0, 0 ), Color( 255, 255, 21 )
end )

LookEnt:RegisterEnt( "bw_spawnpoint", input.LookupBinding( "+use" ), function( aimEnt )
	return (aimEnt:GetUsable() and "Activate") or "Look at", "spawnpoint"
end, 
function( aimEnt )
	return Color( 128, 255, 0 ), Color( 255, 255, 21 )
end )

LookEnt:RegisterEnt( "bw_druglab", input.LookupBinding( "+use" ), function( aimEnt )
	return "Use", "Drug Lab"
end, 
function( aimEnt )
	return Color( 128, 255, 0 ), Color( 255, 255, 21 )
end )

LookEnt:RegisterEnt( "bw_dispenser_armor", input.LookupBinding( "+use" ), function( aimEnt )
	return "Use", "Armor dispenser"
end, 
function( aimEnt )
	return (aimEnt:GetUsable() and Color( 128, 255, 0 )) or Color( 255, 0, 0 ), Color( 255, 255, 21 )
end )

LookEnt:RegisterEnt( "bw_dispenser_paper", input.LookupBinding( "+use" ), function( aimEnt )
	return "Use", "Paper dispenser"
end, 
function( aimEnt )
	return (aimEnt:GetUsable() and Color( 128, 255, 0 )) or Color( 255, 0, 0 ), Color( 255, 255, 21 )
end )

LookEnt:RegisterEnt( "bw_dispenser_ammo", input.LookupBinding( "+use" ), function( aimEnt )
	return "Use", "Ammo dispenser"
end, 
function( aimEnt )
	return (aimEnt:GetUsable() and Color( 128, 255, 0 )) or Color( 255, 0, 0 ), Color( 255, 255, 21 )
end )

LookEnt:RegisterEnt( "bw_vendingmachine", input.LookupBinding( "+use" ), function( aimEnt )
	return "Use", "Vending machine"
end, 
function( aimEnt )
	return (aimEnt:GetUsable() and Color( 128, 255, 0 )) or Color( 255, 0, 0 ), Color( 255, 255, 21 )
end )

LookEnt:RegisterEnt( "bw_drink_drug", input.LookupBinding( "+use" ), function( aimEnt )
	return "Use", aimEnt:GetDrugEffect() or ""
end, 
function( aimEnt )
	return Color( 128, 255, 0 ), Color( 255, 255, 21 )
end )