include('shared.lua')

function ENT:Draw( bDontDrawModel )
	self.Entity:DrawModel()
	
	local owner = self.Owner
	owner = (IsValid(owner) and owner:Nick()) or "unknown"
	local upgrade = self:GetLevel()
	
	local up = upgrade
	if (up == 0) then
		up = 1
	end
	
	local upg = self.Price * up
	
	local upgStr = "Next Level £:"..BaseWars.MoneyFormat(upg)
	if upgrade >= self.MaxLevel then upgStr = "Max Level" end
	
	surface.SetFont("HUDNumber5")
	local TextWidth = surface.GetTextSize(self.PrintName)
	local TextWidth2 = surface.GetTextSize("Level:"..upgrade)
	local TextWidth3 = surface.GetTextSize(upgStr)
	
	cam.Start3D2D(self:CalculateLabelPos(), self:CalculateLabelAngles(), self.DrawScale)
		draw.WordBox(.75, -TextWidth*0.5, -70, self.PrintName, "HUDNumber5", self.LabelColor, color_white)
		draw.WordBox(.75, -TextWidth2*0.5, -24, "Level:"..upgrade, "HUDNumber5", self.LabelColor, color_white)
		draw.WordBox(.75, -TextWidth3*0.5, 22, upgStr, "HUDNumber5", self.LabelColor, color_white)
	cam.End3D2D()
end
