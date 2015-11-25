BaseWars.Money = {}

local tag = "BaseWars.Money"
local tag_escaped = "BaseWars_Money"
local PLAYER = debug.getregistry().Player

BaseWars.Money.Credits = "Based on sh_money by Tenrys; https://github.com/Tenrys/tenrys-scripts/blob/master/lua/autorun/sh_money.lua"

local function isPlayer(ply)

	return (IsValid(ply) and ply:IsPlayer())
	
end

function BaseWars.Money.GetMoney(ply)

	if SERVER then
	
		local dirName = isPlayer(ply) and ply:UniqueID() or (isstring(ply) and ply or nil)
		local money = tonumber(file.Read(tag_escaped .. "/" .. dirName .. "/money.txt", "DATA"))
		return money
		
	elseif CLIENT then
	
		return tonumber(ply:GetNWString(tag)) or 0
		
	end
	
end
PLAYER.GetMoney = BaseWars.Money.GetMoney

if SERVER then


	function BaseWars.Money.InitMoney(ply)
	
		local dirName = isPlayer(ply) and ply:UniqueID() or (isstring(ply) and ply or nil)
		
		if not file.IsDir(tag_escaped .. "/" .. dirName, "DATA") then file.CreateDir(tag_escaped .. "/" .. dirName) end
		if not file.Exists(tag_escaped .. "/" .. dirName .. "/money.txt", "DATA") then file.Write(tag_escaped .. "/" .. dirName .. "/money.txt", "0") end
		
		return dirName
		
	end
	PLAYER.InitMoney = BaseWars.Money.InitMoney

	for k, v in next,player.GetAll() do
		
		BaseWars.Money.InitMoney(v)
	
	end

	function BaseWars.Money.SaveMoney(ply, amount)
	
		local dirName = BaseWars.Money.InitMoney(ply)
		file.Write(tag_escaped .. "/" .. dirName .. "/money.txt", amount or GetMoney(ply))
		
	end
	PLAYER.SaveMoney = BaseWars.Money.SaveMoney
	
	function BaseWars.Money.LoadMoney(ply)
	
		BaseWars.Money.InitMoney(ply)
		ply:SetNWString(tag, tostring(GetMoney(ply)))
		
	end
	PLAYER.LoadMoney = BaseWars.Money.LoadMoney

	function BaseWars.Money.SetMoney(ply, amount)
	
		if not isnumber(amount) or amount < 0 then amount = 0 end
		if amount > 10^12 then amount = 10^12 end
		
		amount = math.Round(amount)
		BaseWars.Money.SaveMoney(ply, amount)
		
		ply:SetNWString(tag, tostring(amount))
		
	end
	PLAYER.SetMoney = BaseWars.Money.SetMoney

	function BaseWars.Money.GiveMoney(ply, amount)
	
		BaseWars.Money.SetMoney(ply, BaseWars.Money.GetMoney(ply) + amount)
		
	end
	PLAYER.GiveMoney = BaseWars.Money.GiveMoney
	
	function BaseWars.Money.TakeMoney(ply, amount)
	
		BaseWars.Money.SetMoney(ply, BaseWars.Money.GetMoney(ply) - amount)
		
	end
	PLAYER.TakeMoney = BaseWars.Money.TakeMoney

	function BaseWars.Money.TransferMoney(ply1, amount, ply2)
	
		BaseWars.Money.TakeMoney(ply1, amount)
		BaseWars.Money.GiveMoney(ply2, amount)
		
	end
	PLAYER.TransferMoney = BaseWars.Money.TransferMoney

	hook.Add("PlayerAuthed", tag .. ".Load", BaseWars.Money.LoadMoney)
	hook.Add("PlayerDisconnected", tag .. ".Save", BaseWars.Money.SaveMoney)

	if easylua and aowl then
	
		local hookNames = {
			[BaseWars.Money.GiveMoney] = ".Give",
			[BaseWars.Money.TakeMoney] = ".Take",
			[BaseWars.Money.SetMoney] = ".Set",
		}

		local function MoneyExcitement(amount)
		
			local excitementLevel = math.Clamp(#string.match(tostring(math.Round(amount, 0)), "%d+") - 3, 0, 5)
			local str = ""
			
			if excitementLevel >= 1 then
			
				str = ("!"):rep(excitementLevel)
				
			else
			
				str = "."
				
			end
			
			return str
			
		end

		local stringsCaller = {
			[BaseWars.Money.GiveMoney] = "You gave $%s to %s%s (hax)",
			[BaseWars.Money.TakeMoney] = "You took $%s from %s%s",
			[BaseWars.Money.SetMoney] = "You set $%s as %s money%s",
		}
		local stringsTarget = {
			[BaseWars.Money.GiveMoney] = "%s gave you $%s%s (hax)",
			[BaseWars.Money.TakeMoney] = "%s took $%s from yourself%s",
			[BaseWars.Money.SetMoney] = "%s set your money to $%s%s (hax)",
		}

		local function MoneyManagementCommand(caller, amount, ply, func)
		
			if not amount then return false, "Invalid amount!" end
			if amount:lower():Trim():match("nan") then return false, "Can't break the system mate" end
			
			local amount, ply = amount:Trim(), ply and ply:Trim() or ""
			
			if ply and  isnumber(tonumber(ply)) then
				local amt,tar = ply,amount
				amount = amt
				ply = tar
			end
			
			local amount = tonumber(amount) or 0
			if not isnumber(amount) or amount < 0 then return false, "Invalid amount!" end
			if amount > 10^12 then amount = 10^12 end
			
			if ply == "" or ply == nil then
			
				ply = caller
				
			else
			
			 	ply = easylua.FindEntity(ply)
			 	ply = isPlayer(ply) == false and caller or ply
				
			end
			
			func(ply, amount)
			hook.Run( tag .. hookNames[func], caller, amount, ply)
			local callerStr = caller == ply and (func == SetMoney and "your" or "yourself") or ply:Nick() .. (func == SetMoney and "'s" or "")
			BaseWars.Util_Player.Notification(caller, string.format(stringsCaller[func], tostring(amount), callerStr, MoneyExcitement(amount)), BASEWARS_NOTIFICATION_ADMIN)
			
			if caller ~= ply then
			
				local plyStr = caller == ply and "you" or caller:Nick()
				BaseWars.Util_Player.Notification(ply, string.format(stringsTarget[func], plyStr, tostring(amount), MoneyExcitement(amount)), BASEWARS_NOTIFICATION_ADMIN)
				
			end
			
		end
		
		aowl.AddCommand("transfermoney", function(caller, _, amount, ply)
		
			if not amount then return false, "Invalid amount!" end
			amount,ply = amount:Trim(), ply and ply:Trim() or ""
			
			if ply and  isnumber(tonumber(ply)) then
			
				local amt,tar = ply,amount
				amount = amt
				ply = tar
				
			end
			
			if amount:lower():Trim():match("nan") then return false, "Can't break the system mate" end
			
			local amount = tonumber(amount) or 0
			
			if not isnumber(amount) or amount <= 0 and not caller:IsAdmin() then amount = 0 end
			if amount > 10^12 then amount = 10^12 end
			if amount > 0 and GetMoney(caller) < amount then return false, "You're too poor for this transaction!" end
			
			if ply ~= "" and ply ~= nil then
			
			 	ply = easylua.FindEntity(ply)
			 	ply = isPlayer(ply) == false and nil or ply
				
			else
			
				return
				
			end
			
			BaseWars.Money.TransferMoney(caller, amount, ply)
			hook.Run(tag .. ".Transfer", caller, amount, ply)
			
			BaseWars.Util_Player.Notification(caller,"You gave " .. ply:Nick() .. " $" .. amount .. MoneyExcitement(amount), BASEWARS_NOTIFICATION_MONEY)
			BaseWars.Util_Player.Notification(ply, caller:Nick() .. " gave you $" .. amount .. MoneyExcitement(amount), BASEWARS_NOTIFICATION_MONEY)
			
		end, "players")

		aowl.AddCommand("givemoney", function(caller, _, amount, ply)
		
			return MoneyManagementCommand(caller, amount, ply, BaseWars.Money.GiveMoney)
			
		end, "admins")

		aowl.AddCommand("takemoney", function(caller, _, amount, ply)
		
			return MoneyManagementCommand(caller, amount, ply, BaseWars.Money.TakeMoney)
			
		end, "admins")

		aowl.AddCommand("setmoney", function(caller, _, amount, ply)
		
			return MoneyManagementCommand(caller, amount, ply, BaseWars.Money.SetMoney)
			
		end, "admins")
		
	end
	
end
