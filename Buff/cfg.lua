



------------
--  ����  --
------------

local cfg = CreateFrame("Frame")
local Media = "Interface\\Addons\\Sora's\\Buff\\media\\"
cfg.Font = "Fonts\\ZYKai_T.ttf"
cfg.bgFile = Media.."iconborder"
cfg.edgeFile = Media.."glowTex"
cfg.IconSize = 30 											-- ͼ���С
cfg.Spacing = 4												-- ͼ����
cfg.BUFFpos = {"TOPRIGHT", UIParent, "TOPRIGHT", -5, -5} 	-- BUFFλ��
	
----------------
--  �����ռ�  --
----------------

local _, SR = ...
SR.ChatConfig = cfg
