﻿----------------
--  命名空间  --
----------------

local _, SR = ...
local oUF = SR.oUF or oUF
local cfg = SR.cfg
local cast = SR.cast

local function MakeShadow(Frame, Size)
	local Shadow = CreateFrame("Frame", nil, Frame)
	Shadow:SetFrameLevel(0)
	Shadow:SetPoint("TOPLEFT", -Size, Size)
	Shadow:SetPoint("BOTTOMRIGHT", Size, -Size)
	Shadow:SetBackdrop({ 
		edgeFile = cfg.GlowTex, edgeSize = Size, 
	})
	Shadow:SetBackdropBorderColor(0, 0, 0, 1)
	return Shadow
end

local function MakeTexShadow(Parent, Anchor, Size)
	local Border = CreateFrame("Frame", nil, Parent)
	Border:SetPoint("TOPLEFT", Anchor, -Size, Size)
	Border:SetPoint("BOTTOMRIGHT", Anchor, Size, -Size)
	Border:SetFrameLevel(1)
	Border:SetBackdrop({ 
		edgeFile = cfg.GlowTex, edgeSize = Size, 
	})
	Border:SetBackdropBorderColor(0, 0, 0, 1)
	return Border
end

local function MakeFontString(Parent, fontsize)
	local tempText = Parent:CreateFontString(nil, "OVERLAY")
	tempText:SetFont(cfg.Font, fontsize, "THINOUTLINE")
	return tempText
end

local function BuildMenu(self)
	local cunit = self.unit:gsub("^%l", string.upper)

	if cunit == "Vehicle" then cunit = "Pet" end

	if _G[cunit.."FrameDropDown"] then
		ToggleDropDownMenu(1, nil, _G[cunit.."FrameDropDown"], "cursor", 0, 0)
	end
end

local function BuildHealthBar(self)
	local Bar = CreateFrame("StatusBar", nil, self)
	Bar:SetStatusBarTexture(cfg.Statusbar)
	Bar:SetHeight(24)
	Bar:SetWidth(self:GetWidth())
	Bar:SetPoint("TOP", 0, 0)
	Bar.Shadow = MakeShadow(Bar, 3)
	Bar.BG = Bar:CreateTexture(nil, "BACKGROUND")
	Bar.BG:SetTexture(cfg.Statusbar)
	Bar.BG:SetAllPoints()
	Bar.BG:SetVertexColor(0.1, 0.1, 0.1)
	Bar.BG.multiplier = 0.2
	
	Bar.frequentUpdates = true
	Bar.colorSmooth = true
	Bar.colorClass = true
	Bar.Smooth = true
		
	self.Health = Bar
end

local function BuildPowerBar(self)
	local Bar = CreateFrame("StatusBar", nil, self)
	Bar:SetStatusBarTexture(cfg.Statusbar)
	Bar:SetWidth(self:GetWidth())
	Bar:SetHeight(2)
	Bar:SetPoint("BOTTOM", self, "BOTTOM", 0, 0)
	Bar.Shadow = MakeShadow(Bar, 3)
	Bar.BG = Bar:CreateTexture(nil, "BACKGROUND")
	Bar.BG:SetTexture(cfg.Statusbar)
	Bar.BG:SetAllPoints()
	Bar.BG:SetVertexColor(0.1, 0.1, 0.1)
	Bar.BG.multiplier = 0.2
	
	Bar.frequentUpdates = true
	Bar.Smooth = true
	Bar.colorPower = true
		
	self.Power = Bar
end

local function BuildClassPowerBar(self)
	local _, Class = UnitClass("player")
	if Class == "DEATHKNIGHT" then
		local Runes = CreateFrame("Frame")
		for i= 1, 6 do
			local Rune = CreateFrame("StatusBar", nil, self)
			Rune:SetSize((self:GetWidth()-15)/6, 3)
			Rune:SetStatusBarTexture(cfg.Statusbar)			
			Rune.BG = Rune:CreateTexture(nil, "BACKGROUND")
			Rune.BG:SetAllPoints()
			Rune.BG:SetTexture(cfg.Statusbar)
			Rune.BG:SetVertexColor(0.1, 0.1, 0.1)			
			Rune.Shadow = MakeShadow(Rune, 3)
			
			if i == 1 then
				Rune:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, 4)
			else
				Rune:SetPoint("LEFT", Runes[i-1], "RIGHT", 3, 0)
			end
			Runes[i] = Rune
		end
		self.Runes = Runes
	end
	if Class == "PALADIN" then
		local HolyPower = CreateFrame("Frame")
		for i = 1, 3 do
			local HolyShard = CreateFrame("StatusBar", nil, self)
			HolyShard:SetSize((self:GetWidth()-10)/3, 3)
			HolyShard:SetStatusBarTexture(cfg.Statusbar)
			HolyShard:SetStatusBarColor(0.9, 0.95, 0.33)		
			HolyShard.Shadow = MakeShadow(HolyShard, 3)

			if i == 1 then
				HolyShard:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, 4)
			else
				HolyShard:SetPoint("TOPLEFT", HolyPower[i-1], "TOPRIGHT", 5, 0)
			end
			HolyPower[i] = HolyShard
		end
		self.HolyPower = HolyPower
		
		local function Override(self, event, unit, powerType)
			local HolyPower = self.HolyPower
			if HolyPower.PreUpdate then 
				HolyPower:PreUpdate(unit) 
			end	
			local num = UnitPower(unit, SPELL_POWER_HOLY_POWER)
			for i = 1, MAX_HOLY_POWER do
				if i <= num then
					HolyPower[i]:SetAlpha(1)
				else
					HolyPower[i]:SetAlpha(0.2)
				end
			end
		end
		self.HolyPower.Override = Override
	end
	if Class == "WARLOCK" then
		local SoulShards = CreateFrame("Frame")
		for i= 1, 3 do
			local SoulShard = CreateFrame("StatusBar", nil, self)
			SoulShard:SetSize((self:GetWidth()-10)/3, 3)
			SoulShard:SetStatusBarTexture(cfg.Statusbar)
			SoulShard:SetStatusBarColor(0.86, 0.44, 1)	
			SoulShard.Shadow = MakeShadow(SoulShard, 3)

			if i == 1 then
				SoulShard:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, 4)
			else
				SoulShard:SetPoint("TOPLEFT", SoulShards[i-1], "TOPRIGHT", 5, 0)
			end
			SoulShards[i] = SoulShard
		end
		self.SoulShards = SoulShards
		
		local function Override(self, event, unit, powerType)
			local SoulShards = self.SoulShards
			local num = UnitPower(unit, SPELL_POWER_SOUL_SHARDS)
			for i = 1, SHARD_BAR_NUM_SHARDS do
				if i <= num then
					SoulShards[i]:SetAlpha(1)
				else
					SoulShards[i]:SetAlpha(0.3)
				end
			end
		end
		self.SoulShards.Override = Override
	end
	if Class == "DRUID" then
		local EclipseBar = CreateFrame("Frame", nil, self)
		EclipseBar:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 4)
		EclipseBar:SetHeight(3)
		EclipseBar:SetWidth(self:GetWidth())
		EclipseBar.Shadow = MakeShadow(EclipseBar, 3)
		EclipseBar.LunarBar = CreateFrame("StatusBar", nil, EclipseBar)
		EclipseBar.LunarBar:SetPoint("LEFT", 0, 0)
		EclipseBar.LunarBar:SetSize(EclipseBar:GetWidth(), EclipseBar:GetHeight())
		EclipseBar.LunarBar:SetStatusBarTexture(cfg.Statusbar)
		EclipseBar.LunarBar:SetStatusBarColor(0, 0.1, 0.7)
		EclipseBar.SolarBar = CreateFrame("StatusBar", nil, EclipseBar)
		EclipseBar.SolarBar:SetPoint("LEFT", EclipseBar.LunarBar:GetStatusBarTexture(), "RIGHT", 0, 0)
		EclipseBar.SolarBar:SetSize(EclipseBar:GetWidth(), EclipseBar:GetHeight())
		EclipseBar.SolarBar:SetStatusBarTexture(cfg.Statusbar)
		EclipseBar.SolarBar:SetStatusBarColor(1, 1, 0.13)
		EclipseBar.Text = MakeFontString(EclipseBar.SolarBar, 9)
		EclipseBar.Text:SetPoint("LEFT", EclipseBar.LunarBar:GetStatusBarTexture(), "RIGHT", -1, 0)
		self:Tag(EclipseBar.Text, "[pereclipse]")
		self.EclipseBar = EclipseBar
	end
	if Class == "SHAMAN" then
		oUF.colors.totems = {
			{ 233/255, 46/255,   16/255 }, 	-- fire
			{ 173/255, 217/255,  25/255 }, 	-- earth
			{  35/255, 127/255, 255/255 }, 	-- water
			{ 178/255,  53/255, 240/255 }, 	-- air
		}
		local TotemBar = CreateFrame("Frame", nil, self)
		for i = 1, 4 do
			local Totem = CreateFrame("Frame", nil, TotemBar)
			Totem:SetHeight(3)
			Totem:SetWidth((self.Health:GetWidth()-15)/4)
			Totem.StatusBar = CreateFrame("StatusBar", nil, Totem)
			Totem.StatusBar:SetAllPoints()
			Totem.StatusBar:SetStatusBarTexture(cfg.Statusbar)	
			Totem.BG = Totem:CreateTexture(nil, "BACKGROUND")
			Totem.BG:SetAllPoints()
			Totem.BG:SetTexture(cfg.Statusbar)
			Totem.BG:SetVertexColor(0.2, 0.2, 0.2, 0.8)
			Totem.Shadow = MakeShadow(Totem, 3)
			Totem.Text = MakeFontString(Totem, 8)
			Totem.Text.Colors = {
				{173/255, 217/255,  25/255}, 	-- earth
				{233/255,  46/255,  16/255}, 	-- fire
				{ 35/255, 127/255, 255/255}, 	-- water
				{178/255,  53/255, 240/255}, 	-- air
			}
			Totem.Text:SetPoint("CENTER", 0, 10)
			Totem.Text:SetTextColor(unpack(Totem.Text.Colors[i]))
			if i == 1 then
				Totem:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, 4)
			else
				Totem:SetPoint("TOPLEFT", TotemBar[i-1], "TOPRIGHT", 5, 0)
			end	
			TotemBar[i] = Totem
		end
		TotemBar.Destroy = true
		TotemBar.AbbreviateNames = true
		TotemBar.UpdateColors = true
		self.TotemBar = TotemBar
	end
	if Class == "ROGUE" or Class == "DRUID" then	
		local CPoints = CreateFrame("Frame", nil, self)	
		for i = 1, MAX_COMBO_POINTS do
			local CPoint = CreateFrame("StatusBar", nil, self)
			CPoint:SetSize((self:GetWidth() / 5)-5, 3)
			CPoint:SetStatusBarTexture(cfg.Statusbar)
			CPoint:SetStatusBarColor(1, 0.9, 0)				
			CPoint.Shadow = MakeShadow(CPoint, 3)
			if i == 1 then
				CPoint:SetPoint("BOTTOMLEFT", self.Health, "TOPLEFT", 0, 4)
			else
				CPoint:SetPoint("TOPLEFT", CPoints[i-1], "TOPRIGHT", 6, 0)
			end
			CPoints[i] = CPoint
		end
		self.CPoints = CPoints
		self.CPoints.unit = "player"
	end
end

local function BuildPortrait(self)
	local Portrait = CreateFrame("PlayerModel", nil, self.Health)
	Portrait:SetAlpha(0.3) 
	Portrait.PostUpdate = function(self) 
		if self:GetModel() and self:GetModel().find and self:GetModel():find("worgenmale") then
			self:SetCamera(1)
		end	
	end
	Portrait:SetAllPoints()
	Portrait:SetFrameLevel(self.Health:GetFrameLevel()+1)
	Portrait:RegisterEvent("PLAYER_REGEN_DISABLED")
	Portrait:RegisterEvent("PLAYER_REGEN_ENABLED")
	Portrait:SetScript("OnEvent", function(self, event, ...)
		if event == "PLAYER_REGEN_DISABLED" then
			UIFrameFadeIn(self, 0.5, 0.3, 0)
		elseif event == "PLAYER_REGEN_ENABLED" then
			UIFrameFadeOut(self, 0.5, 0, 0.3)
		end
	end)
	
	self.Portrait = Portrait
end

local function BuildTags(self)
	local Name = MakeFontString(self.Health, 11)
	Name:SetPoint("LEFT", 5, 0)
	self:Tag(Name, "[Sora:color][name]")
	Name:SetAlpha(0)
	local HPTag = MakeFontString(self.Health, 11)
	HPTag:SetPoint("RIGHT", 0, 0)
	self:Tag(HPTag, "[Sora:color][Sora:hp]")
	HPTag:SetAlpha(0)
	local PPTag = MakeFontString(self.Power, 9)
	PPTag:SetPoint("RIGHT", 0, 0)
	self:Tag(PPTag, "[Sora:pp]")
	PPTag:SetAlpha(0)

	local PowerBar = self.Power
	PowerBar:RegisterEvent("PLAYER_REGEN_DISABLED")
	PowerBar:RegisterEvent("PLAYER_REGEN_ENABLED")
	PowerBar:SetScript("OnEvent", function(self, event, ...)
		if event == "PLAYER_REGEN_DISABLED" then
			UIFrameFadeIn(Name, 0.5, 0, 1)
			UIFrameFadeIn(HPTag, 0.5, 0, 1)
			UIFrameFadeIn(PPTag, 0.5, 0, 1)
		elseif event == "PLAYER_REGEN_ENABLED" then
			UIFrameFadeOut(Name, 0.5, 1, 0)
			UIFrameFadeOut(HPTag, 0.5, 1, 0)
			UIFrameFadeOut(PPTag, 0.5, 1, 0)	
		end
	end)
	PowerBar:SetScript("OnEnter", function()
		if not UnitAffectingCombat("player") then
			UIFrameFadeIn(self.Portrait, 0.5, 0.3, 0)
			UIFrameFadeIn(Name, 0.5, 0, 1)
			UIFrameFadeIn(HPTag, 0.5, 0, 1)
			UIFrameFadeIn(PPTag, 0.5, 0, 1)
		end
	end)
	PowerBar:SetScript("OnLeave", function()
		if not UnitAffectingCombat("player") then
			UIFrameFadeOut(self.Portrait, 0.5, 0, 0.3)
			UIFrameFadeOut(Name, 0.5, 1, 0)
			UIFrameFadeOut(HPTag, 0.5, 1, 0)
			UIFrameFadeOut(PPTag, 0.5, 1, 0)
		end
	end)
end

local function BuildCastbar(self)
	local Bar = CreateFrame("StatusBar", nil, self)
	Bar:SetHeight(9)
	Bar:SetWidth(self:GetWidth()-70)
	Bar:SetStatusBarTexture(cfg.Statusbar)
	Bar:SetStatusBarColor(95/255, 182/255, 255/255, 1)
	if cfg.CastbarAlone then
		Bar:SetHeight(20)
		Bar:SetFrameStrata("HIGH")
		Bar:SetPoint("BOTTOMLEFT", MultiBarBottomRightButton1, "TOPLEFT", -3, 10)
		Bar:SetPoint("BOTTOMRIGHT", MultiBarBottomRightButton12, "TOPRIGHT", -25, 10)			
	else
		Bar:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", 0, -15)
	end
	Bar.Shadow = CreateFrame("Frame", nil, Bar)
	Bar.Shadow:SetPoint("TOPLEFT", -3, 3)
	Bar.Shadow:SetPoint("BOTTOMRIGHT", 3, -3)
	Bar.Shadow:SetFrameLevel(1)
	Bar.Shadow:SetBackdrop({
		bgFile = cfg.Statusbar, 
		insets = { left = 3, right = 3, top = 3, bottom = 3}, 
		edgeFile = cfg.GlowTex, edgeSize = 3, 
	})
	Bar.Shadow:SetBackdropColor(0, 0, 0, 0.5)
	Bar.Shadow:SetBackdropBorderColor(0, 0, 0, 1)
	
	Bar.CastingColor = {95/255, 182/255, 255/255}
	Bar.CompleteColor = {20/255, 208/255, 0/255}
	Bar.FailColor = {255/255, 12/255, 0/255}
	Bar.ChannelingColor = {95/255, 182/255, 255/255}

	Bar.Text = MakeFontString(Bar, 10)
	Bar.Text:SetPoint("LEFT", 2, 0)
	
	Bar.Time = MakeFontString(Bar, 10)
	Bar.Time:SetPoint("RIGHT", -2, 0)
	
	Bar.Icon = Bar:CreateTexture(nil, "ARTWORK")
	Bar.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	Bar.Icon:SetSize(20, 20)
	Bar.Icon:SetPoint("BOTTOMLEFT", Bar, "BOTTOMRIGHT", 8, 0)
	Bar.Icon.Shadow = MakeTexShadow(Bar, Bar.Icon, 3)

	--latency (only for player unit)
	Bar.SafeZone = Bar:CreateTexture(nil, "OVERLAY")
	Bar.SafeZone:SetTexture(cfg.Statusbar)
	Bar.SafeZone:SetVertexColor(1, 0.1, 0, .6)
	Bar.SafeZone:SetPoint("TOPRIGHT")
	Bar.SafeZone:SetPoint("BOTTOMRIGHT")
	Bar.Lag = MakeFontString(Bar, 10)
	Bar.Lag:SetPoint("CENTER", -2, 17)
	Bar.Lag:Hide()
	self:RegisterEvent("UNIT_SPELLCAST_SENT", cast.OnCastSent)

	Bar.OnUpdate = cast.OnCastbarUpdate
	Bar.PostCastStart = cast.PostCastStart
	Bar.PostChannelStart = cast.PostCastStart
	Bar.PostCastStop = cast.PostCastStop
	Bar.PostChannelStop = cast.PostChannelStop
	Bar.PostCastFailed = cast.PostCastFailed
	Bar.PostCastInterrupted = cast.PostCastFailed

	self.Castbar = Bar
end

local function BuildRaidIcon(self)
	local RaidIcon = self.Health:CreateTexture(nil, "OVERLAY")
	RaidIcon:SetSize(16, 16)
	RaidIcon:SetPoint("CENTER", self.Health, "TOP", 0, 2)
	self.RaidIcon = RaidIcon
end

local function BuildCombatIcon(self)
	local Resting = self.Health:CreateTexture(nil, "OVERLAY")
	Resting:SetSize(24, 24)
	Resting:SetPoint("RIGHT", self.Health, "LEFT", -3, 0)
	self.Resting = Resting

	local LeaderIcon = self.Health:CreateTexture(nil, "OVERLAY")
	LeaderIcon:SetSize(16, 16)
	LeaderIcon:SetPoint("TOPLEFT", self.Health, -7, 9)
	self.Leader = LeaderIcon

	local MasterLooterIcon = self.Health:CreateTexture(nil, "OVERLAY")
	MasterLooterIcon:SetSize(16, 16)
	MasterLooterIcon:SetPoint("LEFT", LeaderIcon, "RIGHT")
	self.MasterLooter = MasterLooterIcon
	
	local AssistantIcon = self.Health:CreateTexture(nil, "OVERLAY")
	AssistantIcon:SetSize(16, 16)
	AssistantIcon:SetPoint("TOP", LeaderIcon, "BOTTOM")
	self.Assistant = AssistantIcon
end

local function BuildPlayerFrame(self, ...)
	-- RegisterForClicks
	self.menu = BuildMenu
	self:RegisterForClicks("AnyDown")
	
	-- Set Size and Scale
	self:SetScale(cfg.Scale)
	self:SetSize(220, 30)
	
	-- BuildHealthBar
	BuildHealthBar(self)
	
	-- BuildPowerBar
	BuildPowerBar(self)
	
	-- BuildClassPowerBar
	BuildClassPowerBar(self)
	
	-- BuildPortrait
	BuildPortrait(self)
	
	-- BuildTags
	BuildTags(self)
	
	-- BuildCastbar
	if cfg.ShowCastbar then BuildCastbar(self) end
	
	-- BuildRaidMark
	BuildRaidIcon(self)
	
	-- BuildCombatIcon
	BuildCombatIcon(self)

end

oUF:RegisterStyle("SoraPlayer", BuildPlayerFrame)
oUF:SetActiveStyle("SoraPlayer")
SR.PlayerFrame = oUF:Spawn("player")
SR.PlayerFrame:SetPoint("CENTER", UIParent, "CENTER", -270, -100)