



------------
--  ����  --
------------

local cfg = CreateFrame("Frame")
local MediaPath = "Interface\\AddOns\\Sora's\\Nameplates\\Media\\"
cfg.statusbar_texture = MediaPath.."Statusbar"
cfg.backdrop_edge_texture = MediaPath.."glowTex"
cfg.Font = "Fonts\\ZYKai_T.ttf"
cfg.Fontsize = 10						-- �����С
cfg.Fontflag = "THINOUTLINE"			-- �������
cfg.hpHeight = 5						-- ������Ѫ���߶�
cfg.hpWidth = 120						-- ������Ѫ�����
cfg.raidIconSize = 18					-- �Ŷӱ�Ǵ�С
cfg.cbIconSize = 20					-- ������ʩ����ͼ���С
cfg.cbHeight = 5						-- ������ʩ�����߶�
cfg.cbWidth = 100						-- ������ʩ�������
cfg.CombatToggle = true				-- ����/�뿪ս���Զ�����/�ر�������
  
----------------
--  �����ռ�  --
----------------

local _, SR = ...
SR.NPConfig = cfg