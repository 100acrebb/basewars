AddCSLuaFile()

if SERVER then
	local hostname = GetHostName()
	function SetHostName(what)
		hostname = what
	end
	function GetHostName()
		return hostname
	end
	timer.Create("HostNameRefresher",0.5,0,function()
		SetGlobalString("Hn",hostname)
	end)
else
	function GetHostName()
		return GetGlobalString("Hn")
	end
end