-- playUhr Copyright (C) 2015 Ghosty

local Tag = "playUhr"
local Tag_nw_sv = "pu_saved"
local Tag_nw_ss = "pu_session"

local hField1 = "PlayerInitialSpawn"
-- local hField2 = "PlayerDisconnect"
local hField3 = "Think"

local hName1 = "pu_spawn_mg"
local hName2 = "pu_dcnct_mg"
local hName3 = "pu_think"

local tonumber = tonumber
local tostring = tostring

local pu = {}

local META = FindMetaTable("Player")

if SERVER then

	local savePeriod = CreateConVar("playuhr_save_interval", "5")

	local function UID(ply)

		local uid = 0

		if isentity(ply) and ply:IsPlayer() then

			uid = ply:UniqueID()

		else

			ply = tonumber(ply)

			if isnumber(ply) then uid = ply end

		end

		return tonumber(uid) or 0

	end

	local __uid2ply = player.GetByUniqueID

	local function uid2ply(i)

		return __uid2ply(tostring(i))

	end

	local Times = {}

	local t_session = {}
	local t_saved = {}

	local time = os.time

	function Times:StartSession(ply)

		local uid = UID(ply)

		if not uid then return end

		t_session[uid] = 0

	end

	function Times:EndSession(ply)

		local uid = UID(ply)

		if not uid then return end	

		local n = t_session[uid]
		t_session[uid] = nil

		return tonumber(n) or 0

	end

	function Times:GetSession(ply)

		local uid = UID(ply)

		if not uid then return end	

		local n = t_session[uid]
		return tonumber(n) or 0

	end

	function Times:SetSession(ply,val)

		local uid = UID(ply)

		if not uid then return end

		t_session[ply] = tonumber(val) or 0

	end

	function Times:SetSaved(ply,val)

		local uid = UID(ply)

		if not uid then return end

		val = tonumber(val) or 0
		t_saved[uid] = val

		local __ply = uid2ply(uid) or ply
		__ply:SetNWString(Tag_nw_sv, tostring(val))

	end

	function Times:GetSaved(ply)

		local uid = UID(ply)

		if not uid then return end

		return tonumber(t_saved[uid]) or 0

	end

	local Ticker = {}
	local tks = {}

	function Ticker:Exists(ply)

		local uid = UID(ply)

		if not uid then return false end

		return not not tks[uid]

	end

	function Ticker:AddPlayer(ply)

		local uid = UID(ply)

		if not uid then return end

		tks[uid] = time()

	end

	function Ticker:RemovePlayer(ply)

		local uid = UID(ply)

		if not uid then return end
		if not self:Exists(uid) then return end

		tks[uid] = nil

	end

	function Ticker:GetTick(ply)

		local uid = UID(ply)

		if not uid then return end
		if not self:Exists(uid) then return end

		return tks[uid]

	end

	local floor = math.floor

	function Ticker:Tick(ply)

		local uid = UID(ply)

		if not uid then return end
		if not self:Exists(uid) then return end

		local tick = self:GetTick(uid) or time()
		local timeDiff = time() - tick
		timeDiff = floor(timeDiff)

		local session = Times:GetSession(uid)

		if session ~= timeDiff then

			Times:SetSession(uid, (tonumber(session) or 0) + 1)

			local session = Times:GetSession(uid)
			local __ply = uid2ply(uid) or ply
			__ply:SetNWString(Tag_nw_ss,tostring(session))

		end

	end

	local DataMgr = {}


	local function SQLset(uid,val)
		
		util.SetPData(uid, "playuhrtimes", val)

	end
	local function SQLget(uid)

		return util.GetPData(uid, "playuhrtimes") or 0

	end

	function DataMgr:Load(ply)

		local uid = UID(ply)

		if not uid then return end

		local data = SQLget(uid)
		Times:SetSaved(uid,data)

	end

	function DataMgr:Save(ply,ov)

		local uid = UID(ply)

		if not uid then return end

		local __ply = uid2ply(uid) or ply

		if not __ply then print"erp" return end		

		local data = __ply:GetPlayTime()
		SQLset(uid,ov or data)

	end

	pu.Times 	= Times
	pu.Ticker 	= Ticker
	pu.DataMgr	= DataMgr
	playUhr 	= pu

	local tS = timer.Simple

	local function hook1(ply)

		tS(0,function()

			if not IsValid(ply) then return end
			DataMgr:Load(ply)
			Ticker:AddPlayer(ply)

		end)

	end

--	local function hook2(ply)
--		DataMgr:Save(ply)
--		Ticker:RemovePlayer(ply)
--	end

	local function saveInterval()

		return tonumber(savePeriod:GetString()) or 10

	end

	local hook4
	local function hook3()
		local plys = player.GetAll()
		for _, ply in next,plys do
			Ticker:Tick(ply)
			timer.Adjust(hName2,saveInterval(),0,hook4)
		end
	end
	hook4 = function()

		local plys = player.GetAll()

		for _, ply in next, plys do
			DataMgr:Save(ply)
		end

	end

	hook.Add(hField1,hName1,hook1)
	-- hook.Add(hField2,hName2,hook2)
	timer.Create(hName3,0.01,0,hook3)
	timer.Create(hName2,saveInterval(),0,hook4)

	hook.Add("ShutDown", "playUhr_saveall", hook4)

	hook.Add("PlayerDisconnect", "playUhr_thing", function(ply)

		DataMgr:Save(ply)

	end)

	for _,ply in next, player.GetAll() do

		DataMgr:Load(ply)
		Ticker:AddPlayer(ply)

	end

	function META:GetSessionTime()

		return Times:GetSession(self)

	end

	function META:GetStoredPlayTime()

		return Times:GetSaved(self)

	end

else

	function META:GetSessionTime()

		return tonumber(self:GetNWString(Tag_nw_ss,"0")) or 0

	end

	function META:GetStoredPlayTime()

		return tonumber(self:GetNWString(Tag_nw_sv,"0")) or 0

	end	

end

function META:GetPlayTime()

	return self:GetStoredPlayTime() + self:GetSessionTime()

end

function META:GetPlayTimeTable()

	local time = self:GetPlayTime()
	
	local tbl = {}

	tbl.hour = math.floor(time / 60 / 60)
	tbl.min = math.floor(time / 60) % 60
	tbl.sec = math.floor(time) % 60

	return {
		h = tbl.hour,
		m = tbl.min,
		s = tbl.sec,
	}

end
