# Hexahedronic BaseWars
An open-source version of BaseWars designed to help drive more players into the gamemode, by offering servers a better alternative of the gamemode to run!

This also ships with a modified version of twitch weaponry 2 (credited in the gamemodes credits), if this is in some way voilating someones rights, let us know. :)

## Features

* Easy to setup!
* Easy to configure!
* Easy to use entity bases!

## Installation

### Prerequisites
A CPPI Compliant prop-protection addon.

### Installing the gamemode
Drag it into ```garrysmod/gamemodes``` and extract it.

**For a few things to work you need [EASYLUA](https://github.com/CapsAdmin/fast_addons/blob/master/lua/helpers/easylua.lua) too; it goes in ```lua/autorun```.**

## Screenshots

### Help Menu
![ScreenShot](http://puu.sh/mALs7/ad13259bff.jpg)
### Main Menu
![ScreenShot](http://puu.sh/mALv7/eefc81fe95.jpg)
### Entities
![ScreenShot](http://puu.sh/mALDK/b199a75830.jpg)

## Usage for developers

```
-- Manipulating players money
	ply:GiveMoney(amt)
	ply:SetMoney(amt)
	ply:TakeMoney(amt)

-- Manipulating players level
	ply:AddLevel(amt)
	ply:SetLevel(amt)

	ply:SetXP(amt)
	ply:AddXP(amt)

-- Manipulating players level
	ply:AddKarma(amt)
	ply:SetKarma(amt)

-- Available hooks
-- 'CanBuy' hooks can be returned as false to block buying, with the second arg being an error message
	hook.Add("BaseWars_PlayerEmptyPrinter", "name", function(ply, ent, money) end)

	hook.Add("BaseWars_PlayerCanBuyEntity", "name", function(ply, class) end)
	hook.Add("BaseWars_PlayerCanBuyGun", "name", function(ply, class) end)
	hook.Add("BaseWars_PlayerCanBuyDrug", "name", function(ply, class) end)
	hook.Add("BaseWars_PlayerCanBuyProp", "name", function(ply, class) end)

	hook.Add("BaseWars_PlayerBuyEntity", "name", function(ply, ent) end)
	hook.Add("BaseWars_PlayerBuyGun", "name", function(ply, ent) end)
	hook.Add("BaseWars_PlayerBuyDrug", "name", function(ply, ent) end)
	hook.Add("BaseWars_PlayerBuyProp", "name", function(ply, ent) end)

-- Deriving entities
	ENT.Base = "bw_base" -- Generic electronic
	ENT.Base = "bw_base_electronics" -- Power CONSUMING electronic
	ENT.Base = "bw_base_generator" -- Power GENERATING electronic
	ENT.Base = "bw_base_moneyprinter" -- Template moneyprinter
	ENT.Base = "bw_base_turret" -- Automated turrets!
```

## Contributing

See [CONTRIBUTING](CONTRIBUTING.md).

## Authors

### Hexahedronic

  **Developer:** Callum Slaney (notq2f2@gmail.com)

  **Developer:** Andrew Austin (ghosty.hexahedronic@gmail.com)

  **Developer:** Stepan Fedotov (admin@futuretechs.eu)

### Others

	*Credited in the author field of the gamemode.*

## License

See [LICENSE](LICENSE).
