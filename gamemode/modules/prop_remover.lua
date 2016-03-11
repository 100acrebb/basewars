MODULE.Name 	= "Prop Remover"
MODULE.Author 	= "BROLY" --Thanks to Q2F2 for the tip on what function to hook!
// Finds all physics props on the map and removes them when all the entities are frist initialized (AKA: When the map first loads).

local function RemoveProps()
		for k, v in pairs( ents.FindByClass( "prop_physics*" ) ) do
			print( "PR: Removing: ", v:GetPos() )
			v:Remove()
		end
		print( "PR: All Props Removed!" )
end

hook.Add( "InitPostEntity", "RemoveProps", function()
	//print( "MPR: Initialization Hook Called" )
	if BaseWars.Config.CleanProps then
	RemoveProps()
	end
end )