﻿



------------
--  设置  --
------------

local cfg = CreateFrame("Frame")
local Media = "Interface\\AddOns\\Sora's\\Plugins\\Reminder\\Media\\"
cfg.Font = "Fonts\\ZYKai_T.ttf"
cfg.Solid = Media.."solid"
cfg.GlowTex = Media.."glowTex"
cfg.Warning = Media.."Warning.mp3"


cfg.RaidBuffSize = 18											-- RaidBuff图标大小
cfg.RaidBuffSpace = 4											-- RaidBuff图标间距
cfg.RaidBuffDirection = 1										-- RaidBuff图标排列方向 1-横排 2-竖排
cfg.RaidBuffPos = {"TOPLEFT", Minimap, "BOTTOMLEFT", -5, -35}	-- RaidBuff图标位置
cfg.ShowOnlyInParty = true										-- 只在队伍中显示RaidBuff图标

cfg.ClassBuffSize = 48											-- ClassBuff图标大小
cfg.ClassBuffSpace = 40											-- ClassBuff图标间距
cfg.ClassBuffPos = {"CENTER", UIParent, "CENTER", -150, 150}	-- ClassBuff图标位置
cfg.ClassBuffSound = true										-- 开启缺失ClassBuf声音警报

cfg.ClassBuffList = {
	["DRUID"] = {
		-- 平衡
		[1] = {
			
		},
		-- 野性战斗
		[2] = {
			
		},
		-- 恢复
		[3] = {
			
		},
	},
	
	["MAGE"] = {
		-- 奥术
		[1] = {

		},
		-- 火焰
		[2] = {
			
		},
		-- 冰霜
		[3] = {
			
		},
	},
	
	["HUNTER"] = {
		-- 野兽控制
		[1] = {
			
		},
		-- 射击
		[2] = {
			
		},
		-- 生存
		[3] = {
			
		},
	},
	
	["PRIEST"] = {
		-- 戒律
		[1] = {

		},
		-- 神圣
		[2] = {
			
		},
		-- 暗影
		[3] = {
			
		},
	},
	
	["ROGUE"] = {
		-- 刺杀
		[1] = {

		},
		-- 战斗
		[2] = {
			
		},
		-- 敏锐
		[3] = {
			
		},
	},
	
	["SHAMAN"] = {
		-- 元素战斗
		[1] = {

		},
		-- 增强
		[2] = {
			
		},
		-- 恢复
		[3] = {
			
		},
	},
	
	["PALADIN"] = {
		-- 神圣
		[1] = {

		},
		-- 防护
		[2] = {
			
		},
		-- 惩戒
		[3] = {
			
		},
	},
	
	["WARLOCK"] = {
		-- 痛苦
		[1] = {

		},
		-- 恶魔学识
		[2] = {
			
		},
		-- 毁灭
		[3] = {
			
		},
	},
	
	["DEATHKNIGHT"] = {
		-- 鲜血
		[1] = {
			48263, -- 鲜血灵气
			48263, -- 鲜血灵气
			48263, -- 鲜血灵气
		},
		-- 冰霜
		[2] = {
			
		},
		-- 邪恶
		[3] = {
			
		},
	},
	
	["WARRIOR"] = {
		-- 武器
		[1] = {

		},
		-- 狂怒
		[2] = {
			
		},
		-- 防护
		[3] = {
			
		},
	},
}

cfg.BuffList = {

	[1] = {
		-- 合剂
    	94160, -- 流水合剂
    	79469, -- 钢皮合剂
    	79470, -- 神龙心智合剂
    	79471, -- 风行合剂
    	79472, -- 泰坦之力合剂
    	79638, -- 增强力量
    	79639, -- 增强敏捷
    	79640, -- 增强智力	
		-- 卷轴
		89343, -- 敏捷卷轴
		63308, -- 护甲卷轴
		89347, -- 智力卷轴
		89342, -- 精神卷轴
		89346, -- 力量卷轴  
		-- 战斗药剂
		79481, -- 命中(无限精准药剂)
		79632, -- 急速(狂速药剂)
		79477, -- 暴击(眼镜蛇药剂)
		79635, -- 精通(大师药剂)
		79474, -- 精准(纳迦药剂)
		79468, -- 精神(幽魂药剂)
		-- 守护药剂
		79480, -- 900 护甲
		79631, -- 90 全抗性	
	},
	
	[2] = {		
		-- 食物
		87545, -- 90 力量
		87546, -- 90 敏捷
		87547, -- 90 智力
		87548, -- 90 精神
		87549, -- 90 精通
		87550, -- 90 命中
		87551, -- 90 暴击
		87552, -- 90 急速
		87554, -- 90 躲闪
		87555, -- 90 招架
		87635, -- 90 精准		
	},
	
	[3] = {
		-- 全属性
		20217, -- 王者祝福
		 1126, -- 野性印记
		90363, -- 页岩蛛之拥	
	},
	
	[4] = {
		-- 耐力
		21562, -- 真言术：韧
		  469, -- 命令怒吼
		 6307, -- 血契
		90364, -- 其拉虫群坚韧
		72590, -- 坚韧	
	},
	
	[5] = {
		-- 智力
		79058, -- 奥术智慧
		61316, -- 达拉然光辉
		 1459, -- 奥术光辉
	},
	
	[6] = {
		-- AP
		19740, -- 力量祝福
		30808, -- 怒火释放
		53138, -- 憎恶之力
		19506, -- 强击光环
	},
	
	[7] = {
		-- 回蓝
		 5675, -- 法力之泉图腾
		19740, -- 力量祝福
	},
	
}


	
----------------
--  命名空间  --
----------------

local _, SR = ...
SR.RDConfig = cfg

