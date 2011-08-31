-----------------------------
-- INIT
-----------------------------

local addon, ns = ...
local oUF = ns.oUF or oUF
local cfg = CreateFrame("Frame")
local Media = "Interface\\AddOns\\Sora's\\Unit\\media\\"	-- don't touch this ...

-----------------------------
-- CONFIG
-----------------------------

-- ��λ
cfg.showtot = true				-- ��ʾ"Ŀ���Ŀ��"����
cfg.showpet = true				-- ��ʾ"����"����
cfg.showfocus = true			-- ��ʾ"����"����
cfg.showfocustarget = true		-- ��ʾ"����Ŀ��"����
cfg.showBossFrame = true		-- ��ʾ"Boss"����

-- �Ŷ�&С��
cfg.ShowRaid = true				-- ��ʾ�Ŷӿ���
	cfg.RaidUnitWidth = 74		-- �Ŷӿ��嵥λ�߶�
	cfg.RaidPartyH = true		-- �Ŷӿ����и�С�Ӻ�������
	cfg.showAuraWatch = true	-- �Ŷӿ�������ʾ�߽�Hot/���ܼ���
	cfg.showRaidDebuffs = true 	-- ��ʾRaidDebuff
	
cfg.ShowParty = false			-- ��ʾС�ӿ���
	cfg.showPartyDebuff = true	-- ��ʾС�ӿ���Debuff
	
cfg.raidScale = 1				-- �Ŷ�&С������

-- Buff
cfg.showTargetBuff = true					-- ��ʾĿ�����Buff
	cfg.BuffOnlyShowPlayer = false			-- Ŀ�������ֻ��ʾ��ҵ�Buff
cfg.showTargetDebuff = true					-- ��ʾĿ�����Debuff
	cfg.DebuffOnlyShowPlayer = false		-- Ŀ�������ֻ��ʾ��ҵ�Debuff

cfg.showFocusDebuff = true					-- ��ʾ�������Buff
cfg.showFocusBuff = true 					-- ��ʾ�������Debuff
cfg.showBossBuff = true 					-- ��ʾBoss����Buff
cfg.showBossDebuff = true					-- ��ʾBoss����Debuff

-- ʩ����
cfg.ShowCastbar = true				-- ��ʾʩ����
	cfg.CastbarAlone = false		-- true : ������ʩ���� false : ���������ͷ��֮�µ�Сʩ����

-- ����
cfg.RCheckIcon = true				-- ��ʾ��λȷ��ͼ��
cfg.ShowIncHeals = true				-- ��ʾ����Ԥ��
cfg.showLFDIcons = true				-- ��ʾ���������ɫͼ��
cfg.scale = 1						-- ������������




cfg.statusbar_texture = Media.."Statusbar"
cfg.powerbar_texture = Media.."Minimalist"
cfg.backdrop_texture = Media.."backdrop"
cfg.highlight_texture = Media.."raidbg"
cfg.debuffhighlight_texture = Media.."debuff_highlight"
cfg.backdrop_edge_texture = Media.."backdrop_edge"
cfg.spark = Media.."spark"
cfg.font = "Fonts\\ZYKai_T.ttf"
cfg.smallfont = "Fonts\\ZYKai_T.ttf"

-----------------------------
-- HANDOVER
-----------------------------

ns.cfg = cfg
