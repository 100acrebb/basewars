GM.Name 	= "BaseWars"
GM.Author 	= "Q2F2, Liquid, Ghosty"
GM.Website 	= "http://hexahedronic.org/"
GM.Description = "Fuck luke"

BaseWars = {}

BASEWARS_NOTIFICATION_ERROR = Color(255, 0, 0, 255)
BASEWARS_NOTIFICATION_MONEY = Color(0, 255, 0, 255)
BASEWARS_NOTIFICATION_ADMIN = color_white
BASEWARS_NOTIFICATION_RAID 	= Color(255, 255, 0, 255)
BASEWARS_NOTIFICATION_GENRL = Color(255, 0, 255, 255)

local PlayersCol = Color(125, 125, 125, 255)
team.SetUp(1, "Players", PlayersCol)

function GM:PlayerNoClip(ply, state)

	local Admin = ply:IsAdmin()
	
	if SERVER then
	
		if aowl and not Admin and not State and not ply.__is_being_physgunned then
		
			return true
			
		end
	
	end
	
	return Admin
	
end
