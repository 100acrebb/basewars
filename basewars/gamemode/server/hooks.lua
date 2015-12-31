hook.Add( "BaseWars_PlayerBuyEntity", "XPRewards", function( ply, ent )
	local ent = BaseWars.Ents:Valid( ent )
	if not ent then return end
	local class = ent:GetClass()
	
	if string.find( class, "bw_printer_" ) or class == bw_base_moneyprinter" then
		ply:AddXP( 75 )
	elseif string.find( class, "bw_gen_" ) then
		ply:AddXP( 100 )
	elseif class == "bw_printerpaper" then
		ply:AddXP( 5 )
	end
end )

hook.Add( "BaseWars_PlayerCanBuyGun", "AntiFaggot", function( ply, class ) --Replace this
	return ply:HasLevel( 2 ), "You need to have level 2 to buy guns."
end )
