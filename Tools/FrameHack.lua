-- ����С�ӿ���
function HideParty()

	for i = 1, MAX_PARTY_MEMBERS do
		local party = _G['PartyMemberFrame'..i]
		party:UnregisterAllEvents()
		party:Hide()
		party.Show = function() end
	end
	UIParent:UnregisterEvent('RAID_ROSTER_UPDATE')
end
HideParty()

-- ����BOSS���� --

function hideBossFrames()
	for i = 1, 4 do
		local frame = _G["Boss"..i.."TargetFrame"]
		frame:UnregisterAllEvents()
		frame.Show = function () end
		frame:Hide()
	end
end
hideBossFrames()

-- �ƶ�����׷�ٿ��� --

local _G = _G
  
local function WatchFrameMove()
	local Temp = _G['WatchFrame']
    Temp:ClearAllPoints()	
    Temp.ClearAllPoints = function() end
    Temp:SetPoint("RIGHT","UIParent","RIGHT",-5,30)
    Temp.SetPoint = function() end
	Temp:SetHeight(400)  
end
WatchFrameMove() 


-- ����ϵͳ������ʾ --

local event = CreateFrame"Frame"
local dummy = function() end

UIErrorsFrame:UnregisterEvent"UI_ERROR_MESSAGE"
event.UI_ERROR_MESSAGE = function(self, event, error)
	if(not stuff[error]) then
		UIErrorsFrame:AddMessage(error, 1, .1, .1)
	end
end
	
event:RegisterEvent"UI_ERROR_MESSAGE"