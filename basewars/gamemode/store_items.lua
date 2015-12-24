BaseWars.Store = {}

BaseWars.Store.Items = {

	Cosmetics = {
	
		-- You can use the index or v.Name, wherever it's more appropriate.
		["Meme Hat"] = {
		
			Name 		= "Meme Hat",
			Price 		= 300,
			
			-- Like pointshop this can be 'Model' or Material' respectively.
			-- If it's model then make it a model like the pointshop, if its a material
			-- then just draw a square of the material.
			Model		= "models/props_c17/FurnitureWashingmachine001a.mdl",
			
			-- You don't need to know what any of this does
			OnEquip 	= function(ply) end,
			OnRemove	= function(ply) end,
		
		},
	
	},
	
	Boosts = {
	
		-- You can use the index or v.Name, wherever it's more appropriate.
		["Autism Boost"] = {
		
			Name 		= "Autism Boost",
			Price 		= 700,
			
			-- Like pointshop this can be 'Model' or Material' respectively.
			-- If it's model then make it a model like the pointshop, if its a material
			-- then just draw a square of the material.
			Material	= "models/props/cs_assault/dollar",
			
			-- You don't need to know what any of this does
			OnEquip 	= function(ply) end,
			OnRemove	= function(ply) end,
		
		},
	
	},

}
