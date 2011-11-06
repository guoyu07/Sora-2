﻿-- Engines
local S, C, L, DB = unpack(select(2, ...))

------------------------------------------------------
-- INITIAL FRAME CREATION ----------------------------
------------------------------------------------------
stAddonManager = CreateFrame("Frame", "stAddonManager", UIParent)
stAddonManager:SetFrameStrata("HIGH")
stAddonManager.header = CreateFrame("Frame", "stAddonmanager_Header", stAddonManager)

stAddonManager.header:SetPoint("CENTER", UIParent, "CENTER", 0, 150)
stAddonManager:SetPoint("TOP", stAddonManager.header, "TOP", 0, 0)

------------------------------------------------------
-- FUNCTIONS -----------------------------------------
------------------------------------------------------

local function StripTextures(object, kill)
	for i=1, object:GetNumRegions() do
		local region = select(i, object:GetRegions())
		if region:GetObjectType() == "Texture" then
			region:SetTexture(nil)
		end
	end		
end

local function SkinScrollBar(frame, thumbTrim)
	if _G[frame:GetName().."BG"] then _G[frame:GetName().."BG"]:SetTexture(nil) end
	if _G[frame:GetName().."Track"] then  _G[frame:GetName().."Track"]:SetTexture(nil) end
	
	if _G[frame:GetName().."Top"] then
		_G[frame:GetName().."Top"]:SetTexture(nil)
		_G[frame:GetName().."Bottom"]:SetTexture(nil)
		_G[frame:GetName().."Middle"]:SetTexture(nil)
	end

	local uScroll = _G[frame:GetName().."ScrollUpButton"]
	local dScroll = _G[frame:GetName().."ScrollDownButton"]
	local track = _G[frame:GetName().."Track"]
	
	if uScroll and dScroll then
		StripTextures(uScroll)		
		StripTextures(dScroll)
		dScroll:EnableMouse(false)
		uScroll:EnableMouse(false)

		if frame:GetThumbTexture() then
			frame:GetThumbTexture():SetTexture(nil)
			if not frame.thumbbg then
				frame.thumbbg = CreateFrame("Frame", nil, frame)
				frame.thumbbg:SetPoint("TOPLEFT", frame:GetThumbTexture(), "TOPLEFT", 2, 14)
				frame.thumbbg:SetPoint("BOTTOMRIGHT", frame:GetThumbTexture(), "BOTTOMRIGHT", -2, -14)
				frame.thumbbg:SetBackdrop({bgFile = DB.Statusbar})
				frame.thumbbg:SetBackdropColor(0.8, 0.8, 0.8, 0.8)
				if frame.trackbg then frame.thumbbg:SetFrameLevel(frame.trackbg:GetFrameLevel()+2) end
			end
		end	
	end	
end

function stAddonManager:UpdateAddonList(queryString)
	local addons = {}
	for i=1, GetNumAddOns() do
		local name, title, notes, enabled, loadable, reason, security = GetAddOnInfo(i)
		local lwrTitle, lwrName = strlower(title), strlower(name)
		if (queryString and (strfind(lwrTitle,strlower(queryString)) or strfind(lwrName,strlower(queryString)))) or (not queryString) then
			addons[i] = {}
			addons[i].name = name
			addons[i].title = title
			addons[i].notes = notes
			addons[i].enabled = enabled
		end
	end
	return addons
end

local function LoadWindow()
	if not stAddonManager.Loaded then
		local window = stAddonManager
		local header = window.header
		
		tinsert(UISpecialFrames,window:GetName());
		
		window:SetSize(400,400)
		header:SetSize(400,20)
		
		window.shadow = CreateFrame("Frame", nil, stAddonManager)
		window.shadow:SetFrameLevel(0)
		window.shadow:SetPoint("TOPLEFT", -5, 5)
		window.shadow:SetPoint("BOTTOMRIGHT", 5, -5)
		window.shadow:SetBackdrop({ 
			bgFile = DB.bgFile, insets = {left = 5, right = 5, top = 5, bottom = 5},
			edgeFile = DB.GlowTex, edgeSize = 4,
		})
		window.shadow:SetBackdropColor(0, 0, 0, 0.6)
		window.shadow:SetBackdropBorderColor(0, 0, 0, 0.8)
			
		header:EnableMouse(true)
		header:SetMovable(true)
		header:SetScript("OnMouseDown", function(self) self:StartMoving() end)
		header:SetScript("OnMouseUp", function(self) self:StopMovingOrSizing() end)
		
		local hTitle = stAddonManager.header:CreateFontString(nil, "OVERLAY")
		hTitle:SetFont(DB.Font, 11, "THINOUTLINE")
		hTitle:SetPoint("CENTER")
		hTitle:SetText("插件管理")
		header.title = hTitle 

		local close = S.MakeButton(header)
		close:SetPoint("RIGHT", -2, 0)
		close:SetFrameLevel(header:GetFrameLevel()+2)
		close:SetSize(16, 16)
		close.text = S.MakeFontString(close, 12)
		close.text:SetText("x")
		close.text:SetPoint("CENTER", close, "CENTER", 0, 0)
		close:HookScript("OnEnter", function(self) self.text:SetTextColor(0/255, 170/255, 255/255) end)
		close:HookScript("OnLeave", function(self) self.text:SetTextColor(255/255, 255/255, 255/255) end)
		close:SetScript("OnClick", function() window:Hide() end)
		header.close = close
		
		addonListBG = CreateFrame("Frame", window:GetName().."_ScrollBackground", window)
		addonListBG:SetPoint("TOPLEFT", header, "TOPLEFT", 10, -50)
		addonListBG:SetWidth(window:GetWidth()-20)
		addonListBG:SetHeight(window:GetHeight()-60)
		
		--Create scroll frame (God damn these things are a pain)
		local scrollFrame = CreateFrame("ScrollFrame", window:GetName().."_ScrollFrame", window, "UIPanelScrollFrameTemplate")
		scrollFrame:SetPoint("TOPLEFT", addonListBG, "TOPLEFT", 0, -2)
		scrollFrame:SetWidth(addonListBG:GetWidth()-25)
		scrollFrame:SetHeight(addonListBG:GetHeight()-5)
		SkinScrollBar(_G[window:GetName().."_ScrollFrameScrollBar"])
		scrollFrame:SetFrameLevel(window:GetFrameLevel()+1)
		
		scrollFrame.Anchor = CreateFrame("Frame", window:GetName().."_ScrollAnchor", scrollFrame)
		scrollFrame.Anchor:SetPoint("TOPLEFT", scrollFrame, "TOPLEFT", 0, -3)
		scrollFrame.Anchor:SetWidth(window:GetWidth()-40)
		scrollFrame.Anchor:SetHeight(scrollFrame:GetHeight())
		scrollFrame.Anchor:SetFrameLevel(scrollFrame:GetFrameLevel()+1)
		scrollFrame:SetScrollChild(scrollFrame.Anchor)
	
		--Load up addon information
		stAddonManager.AllAddons = stAddonManager:UpdateAddonList()
		stAddonManager.FilteredAddons = stAddonManager:UpdateAddonList()
		stAddonManager.showEnabled = true
		stAddonManager.showDisabled = true
		
		stAddonManager.Buttons = {}
		
		--Create initial list
		for i, addon in pairs(stAddonManager.AllAddons) do
			local button = CreateFrame("Frame", nil, scrollFrame.Anchor)
			button:SetFrameLevel(scrollFrame.Anchor:GetFrameLevel() + 1)
			button:SetSize(16, 16)
			button:SetBackdrop({bgFile = DB.Statusbar})
			if addon.enabled then
				button:SetBackdropColor(0/255, 170/255, 255/255)
			else
				button:SetBackdropColor(0.05, 0.05, 0.05, 0.9)				
			end
			
			if i == 1 then
				button:SetPoint("TOPLEFT", scrollFrame.Anchor, "TOPLEFT", 5, -5)
			else
				button:SetPoint("TOP", stAddonManager.Buttons[i-1], "BOTTOM", 0, -5)
			end
			button.text = button:CreateFontString(nil, "OVERLAY")
			button.text:SetFont(DB.Font, 11, "THINOUTLINE")
			button.text:SetJustifyH("LEFT")
			button.text:SetPoint("LEFT", button, "RIGHT", 8, 0)
			button.text:SetPoint("RIGHT", scrollFrame.Anchor, "RIGHT", 0, 0)
			button.text:SetText(addon.title)
			
			button:SetScript("OnMouseDown", function(self)
				if addon.enabled then
					self:SetBackdropColor(0.05, 0.05, 0.05, 0.9)
					DisableAddOn(addon.name)
					addon.enabled = false
				else
					self:SetBackdropColor(0/255, 170/255, 255/255)
					EnableAddOn(addon.name)
					addon.enabled = true
				end
			end)
			
			stAddonManager.Buttons[i] = button
		end
		
		local function UpdateList(AddonsTable)
			--Start off by hiding all of the buttons
			for _, b in pairs(stAddonManager.Buttons) do b:Hide() end
			
			local bIndex = 1
			for i, addon in pairs(AddonsTable) do
				local button = stAddonManager.Buttons[bIndex]
				button:Show()
				if addon.enabled then
					button:SetBackdropColor(0/255, 170/255, 255/255)
				else
					button:SetBackdropColor(0.05, 0.05, 0.05, 0.9)
				end
				
				button:SetScript("OnMouseDown", function(self)
					if addon.enabled then
						self:SetBackdropColor(0.05, 0.05, 0.05, 0.9)
						DisableAddOn(addon.name)
						addon.enabled = false
					else
						self:SetBackdropColor(0/255, 170/255, 255/255)
						EnableAddOn(addon.name)
						addon.enabled = true
					end
				end)
				
				button.text:SetText(addon.title)
				bIndex = bIndex+1
			end
		end
		
		--Search Bar
		local searchBar = CreateFrame("EditBox", window:GetName().."_SearchBar", window)
		searchBar:SetFrameLevel(window:GetFrameLevel()+1)
		searchBar:SetPoint("TOPLEFT", header, "BOTTOMLEFT", 10, -5)
		searchBar:SetWidth(250)
		searchBar:SetHeight(20)
		searchBar:SetFont(DB.Font, 11, "THINOUTLINE")
		searchBar:SetText("搜索")
		searchBar:SetAutoFocus(false)
		searchBar:SetTextInsets(3, 0, 0 ,0)
		searchBar:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
		searchBar:SetScript("OnEscapePressed", function(self) searchBar:SetText("搜索") UpdateList(stAddonManager.AllAddons) searchBar:ClearFocus() end)
		searchBar:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
		searchBar:SetScript("OnTextChanged", function(self, input)
			if input then
				stAddonManager.FilteredAddons = stAddonManager:UpdateAddonList(self:GetText())
				UpdateList(stAddonManager.FilteredAddons)
			end
		end)
		
		local sbClear = S.MakeButton(window)
		sbClear:SetPoint("RIGHT", searchBar, "RIGHT", 0, 0)
		sbClear:SetFrameLevel(searchBar:GetFrameLevel()+2)
		sbClear:SetSize(20, 20)
		sbClear.text = S.MakeFontString(sbClear, 12)
		sbClear.text:SetText("x")
		sbClear.text:SetPoint("CENTER", sbClear, "CENTER", 0, 0)
		sbClear:HookScript("OnEnter", function(self) self.text:SetTextColor(0/255, 170/255, 255/255) end)
		sbClear:HookScript("OnLeave", function(self) self.text:SetTextColor(255/255, 255/255, 255/255) end)
		sbClear:SetScript("OnClick", function(self) searchBar:SetText("搜索") UpdateList(stAddonManager.AllAddons) searchBar:ClearFocus() end)
		searchBar.clear = sbClear

		local reloadButton = S.MakeButton(window)
		reloadButton:SetPoint("LEFT", searchBar, "RIGHT", 5, 0)
		reloadButton:SetWidth(window:GetWidth()-25-searchBar:GetWidth())
		reloadButton:SetHeight(searchBar:GetHeight())
		reloadButton.text = S.MakeFontString(reloadButton, 12)
		reloadButton.text:SetPoint("CENTER")
		reloadButton.text:SetText("重载UI")
		reloadButton:HookScript("OnEnter", function(self) self.text:SetTextColor(0/255, 170/255, 255/255) end)
		reloadButton:HookScript("OnLeave", function(self) self.text:SetTextColor(255/255, 255/255, 255/255) end)
		reloadButton:SetScript("OnClick", function(self) ReloadUI() end)
		
		stAddonManager.Loaded = true
	else
		stAddonManager:Show()
	end
end

local gmbAddOns = CreateFrame("Button", "GameMenuButtonAddOns", GameMenuFrame, "GameMenuButtonTemplate")
gmbAddOns:SetSize(GameMenuButtonMacros:GetWidth(), GameMenuButtonMacros:GetHeight())
GameMenuFrame:SetHeight(GameMenuFrame:GetHeight()+GameMenuButtonMacros:GetHeight());
GameMenuButtonLogout:SetPoint("TOP", gmbAddOns, "BOTTOM", 0, -1)
gmbAddOns:SetPoint("TOP", GameMenuButtonMacros, "BOTTOM", 0, -1)
gmbAddOns:SetText("插件管理")
gmbAddOns:SetScript("OnClick", function()
	HideUIPanel(GameMenuFrame);
	LoadWindow()
end)