



------------
--  ����  --
------------

local cfg = CreateFrame("Frame")
local Media = "Interface\\AddOns\\Sora's\\Threat\\Media\\"
cfg.Font = "Fonts\\ZYKai_T.ttf"
cfg.Statusbar = Media.."statusbar"
cfg.GlowTex = Media.."glowTex"
cfg.Solid = Media.."solid"
cfg.ArrowLarge = Media.."ArrowLarge"
cfg.ArrowSmall = Media.."ArrowSmall"
cfg.Pos = {"TOP","oUF_SoraPlayer", "BOTTOM", 0, -60}	-- �����λ��(������,����ê�����������,����oUFͷ��)
cfg.NameTextL = 3	-- ��������(��λ:��)
cfg.ThreatLimited = 2	-- ��ʾ�������(������Tank)

	
----------------
--  �����ռ�  --
----------------

local _, SR = ...
SR.ThreatConfig = cfg

