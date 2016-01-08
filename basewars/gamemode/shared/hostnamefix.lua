AddCSLuaFile()

if SERVER then

	local hostname = GetConVar("hostname"):GetString() 
	function SetHostName(what)
	
		hostname = what
		game.ConsoleCommand("hostname " .. what .. "\n")
		
	end
	
	function GetHostName()
	
		return hostname
		
	end
	
	hook.Add( "Initialize", "HostNameInit", function()

		timer.Simple( 30, function()
			hostname = GetConVar("hostname"):GetString()
		end )
	
	end )
	
	timer.Create("HostNameRefresher", 1, 0, function()
	
		SetGlobalString("Hn", hostname)
		
	end)
	
else

	function GetHostName()
	
		return GetGlobalString("Hn")
		
	end
	
end
