﻿




------------
--  设置  --
------------

local cfg = CreateFrame("Frame")
local Media = "Interface\\Addons\\Sora's\\Chat\\Media\\"
cfg.Font = "Fonts\\ZYKai_T.ttf"
cfg.bgFile = "Interface\\Tooltips\\UI-Tooltip-Background"
cfg.edgeFile = Media.."glowTex"
cfg.Statusbar = Media.."Statusbar"
cfg.Icon = "Interface\\Addons\\Sora's\\Chat\\icon\\"

cfg.AutoSet = true	-- 关闭自动设置(关闭后才能手动设置聊天框体)
	
----------------
--  命名空间  --
----------------

local _, SR = ...
SR.ChatConfig = cfg