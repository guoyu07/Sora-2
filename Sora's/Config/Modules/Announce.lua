-- Engines
local S, C, L, DB = unpack(select(2, ...))
local Sora = LibStub("AceAddon-3.0"):GetAddon("Sora")

-- Init
DB["Modules"]["Announce"] = {}
local Module = DB["Modules"]["Announce"]

-- LoadSettings
function Module.LoadSettings()
	local Default = {
		["Open"] = false,
		["All"] = false,
		["SpellList"] = {
		34477,	-- ��
		19801,	-- �������
		57934,	-- ͵��Q��
		20484,	-- ����
		633,	-- �}���g
		10060,  --������ע
		33206,   -- ʹ����ѹ
		47788,   -- ���o�}�`
		1022, --���o�}�R
		},
	}
	if not AnnounceDB then AnnounceDB = {} end
	for key, value in pairs(Default) do
		if AnnounceDB[key] == nil then AnnounceDB[key] = value end
	end
	wipe(Default)
end

-- ResetToDefault
function Module.ResetToDefault()
	wipe(AnnounceDB)
end

-- BuildGUI
local AnnounceListTable = {}

local function UpdateAnnounceListTable()
	wipe(AnnounceListTable)
	AnnounceListTable["SpellListNew"] = {
		type = "input", order = 1,
		name = "�������Ŀ", width = "full",
		get = function() return "��" end,
		set = function(_, value)
			local Name = GetSpellInfo(tonumber(value))
			ClassTimerDB["SpellList"][Name] = true
			UpdateAnnounceListTable()
		end,
	}
	local Order = 1
	for key, value in pairs(AnnounceDB["SpellList"]) do
		if value then
			Order = Order + 1
			BlackListTable[key] = {
				type = "toggle", order = Order,
				name = key, desc = "����/����",
				get = function() return value end,
				set = function(_, val)
					AnnounceDB["SpellList"][key] = val
					UpdateAnnounceListTable()
				end,
			}
		end
	end
end

function Module.BuildGUI()
	if DB["Config"] then
		DB["Config"]["Announce"] =  {
			type = "group", order = 14,
			name = "ʩ��ͨ��", 
			args = {
				Gruop_1 = {
					type = "group", order = 1, 
					name = " ", guiInline = true, 
					args = {
						Open = {
							type = "toggle", order = 1,
							name = "�Ƿ���ʩ��ͨ��",
							get = function() return AnnounceDB.Open end,
							set = function(_, value) AnnounceDB.Open = value end,
						},
						All = {
							type = "toggle", order = 2,
							name = "�Ƿ�ͨ��ȫ�ŵķ����ͷ�",
							get = function() return AnnounceDB.All end,
							set = function(_, value) AnnounceDB.All = value end,
						},
					},
				},	
				Gruop_2 = {	
					type = "group", order = 2, 
						name = " ", guiInline = true, 
						args = {
							List = {
							type = "group", order = 1, 
							name = "ͨ�������б�", guiInline = true, 
							args = AnnounceListTable,
						}, 
					},
				},
			},	
		}
	end
end