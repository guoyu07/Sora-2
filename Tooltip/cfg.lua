



------------
--  ����  --
------------

local cfg = CreateFrame("Frame")
local Media = "InterFace\\AddOns\\Sora's\\Tooltip\\Media\\"
cfg.Font = "Fonts\\ZYKai_T.ttf"
cfg.Fontsize = 11
cfg.GlowTex = Media.."glowTex"

cfg.colorborderClass = true											-- �߿�ְҵ��ɫ
cfg.Cursor = true													-- ��ʾ����������
	cfg.Position = { "BOTTOMRIGHT", nil, "BOTTOMRIGHT", -50, 200 }	-- ������������,����ʾ�����λ��
cfg.HideInCombat = true 											-- ����ս���Զ�������ʾ����


----------------
--  �����ռ�  --
----------------

local _, SR = ...
SR.TooltipConfig = cfg

