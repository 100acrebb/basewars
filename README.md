# Hexahedronic BaseWars
An open-source version of BaseWars designed to help drive more players into the gamemode, by offering servers a better alternative of the gamemode to run!

This also ships with a modified version of Twitch Weaponry 2 (credited in the gamemode's credits), if this is in some way violating someones rights, let us know. :)

## Features

* Easy to setup!
* Easy to configure!
* Easy to use entity bases!
* Crashes recover lost player money! (Most of the time, it's not perfect)
* Progression via a leveling system! (Also configurable!)
* Automated Anti-SpawnKill!
* Automated raiding! No more 'random raids'!
* Custom chatbox! (People sell stuff like this ALONE for money...)
* Built in Textscreens! (Better than the public version; parser based, no fixed line amt, ect, but no gui as of yet...)
* Language support! (Per-server, sorry, it would be a pain to make it per-client now.)


## Installation

### Prerequisites
* A CPPI Compliant prop-protection addon.
* A fading door addon.

### Installing the gamemode
* Drag it into ```garrysmod/gamemodes``` and extract it.
* Edit ```garrysmod/gamemodes/basewars/gamemode/config.lua``` to your own liking.

**For a few things to work you need [EASYLUA](https://github.com/CapsAdmin/fast_addons/blob/master/lua/helpers/easylua.lua) too; it goes in ```lua/autorun```.**

## Screenshots

### Help Menu
![ScreenShot](http://puu.sh/mALs7/ad13259bff.jpg)
### Main Menu
![ScreenShot](http://puu.sh/mALv7/eefc81fe95.jpg)
### Entities
![ScreenShot](http://puu.sh/mALDK/b199a75830.jpg)
### Chatbox
![ScreenShot](http://puu.sh/mANRz/5577d91aa3.jpg)
### Textscreens
![ScreenShot](http://puu.sh/mAOmT/370b971f4f.jpg)

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

-- Manipulating players karma
	ply:AddKarma(amt)
	ply:SetKarma(amt)
	
-- Utility global functions
	BaseWars.Raid:IsOnGoing()
	
	BaseWars.UTIL.Log(...)
	BaseWars.UTIL.RefundAll(ply, returnAsTable) -- Call with no arg to do full server refund, with arg to refund only them, call with second arg to REFUND NO-ONE but get a 'UID = Money' table
	
	BaseWars.NumberFormat(number) -- Converts to scale suffixed, eg 8,100,000 -> 8.1 Million
	
	
-- Utility metamethods
	ply:InFaction(name, leader) -- args optional, ply:InFaction() for ANY faction, ply:InFaction(nil, true) if LEADER of ANY faction, ect
	
	ply:InRaid()
	ply:Raidable(ignoreCooldown)
	
	ply:Notify(string, color) -- For strings try and keep them localised using BaseWars.LANG, and there are some global color enums, BASEWARS_NOTIFCATION_*
	
	
-- Available hooks
	hook.Add("BaseWars_PlayerEmptyPrinter", "name", function(ply, ent, money) end)
	
	hook.Add("BaseWars_PlayerBuyEntity", "name", function(ply, ent) end)
	hook.Add("BaseWars_PlayerBuyGun", "name", function(ply, ent) end)
	hook.Add("BaseWars_PlayerBuyDrug", "name", function(ply, ent) end)
	hook.Add("BaseWars_PlayerBuyProp", "name", function(ply, ent) end)

-- 'CanBuy' hooks can be returned as false to block buying, with the second arg being an error message
	hook.Add("BaseWars_PlayerCanBuyEntity", "name", function(ply, class) end)
	hook.Add("BaseWars_PlayerCanBuyGun", "name", function(ply, class) end)
	hook.Add("BaseWars_PlayerCanBuyDrug", "name", function(ply, class) end)
	hook.Add("BaseWars_PlayerCanBuyProp", "name", function(ply, class) end)
	
-- Similar to the 'CanBuy', you can return false with an error message.
	hook.Add("CanCreateFaction", "name", function(ply, name, password) end)
	hook.Add("CanJoinFaction", "name", function(ply, name, password) end)
	hook.Add("CanLeaveFaction", "name", function(ply, disband) end)
	
-- Same as above, false to make them unraidable, followed by a reason why.
	hook.Add("PlayerIsRaidable", "name", function(ply) end)

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

	Credited in the author field of the gamemode.

## License

See [LICENSE](LICENSE).
