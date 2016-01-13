hook.Add("BaseWars_PlayerBuyEntity", "XPRewards", function(ply, ent)

	local ent = BaseWars.Ents:Valid(ent)
	if not ent then return end

	local class = ent:GetClass()
	
	if class:match("bw_printer_") or class == "bw_base_moneyprinter" then

		local lvl = (ent.CurrentValue or 0) / 1000
		ply:AddXP(25 * lvl)

	elseif class:match("bw_gen_") then

		ply:AddXP(100)

	elseif class == "bw_printerpaper" then

		ply:AddXP(5)

	end

end)

hook.Add("BaseWars_PlayerCanBuyGun", "AntiFaggot", function(ply, class) --Replace this -Trix

	local requiredLevel = BaseWars.Config.LevelSettings.BuyWeapons

	return ply:HasLevel(requiredLevel), "You need to be at level " .. requiredLevel .. " to buy weapons."

end) -- ok senpai -Ghosty

hook.Add("BaseWars_PlayerEmptyPrinter", "XPRewards", function(ply, ent, money)
	
	ply:AddXP(math.max(0, money / 1000))
	
end)

timer.Create("BaseWars_KarmaRecover", 3 * 60, 0, function()

	for k, v in next, player.GetAll() do
	
		if v:GetKarma() < 0 then
		
			v:AddKarma(1)
			
		end
	
	end

end)
