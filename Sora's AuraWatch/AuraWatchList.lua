﻿--[[
	
	Filger
	Copyright (c) 2009, Nils Ruesch
	All rights reserved.
	
]]

--[[
	
	FilgerMod
	A Mod Based on Filger ：)
	By Neavo
	neavo7@Gmail.com
]]

--[[

	关于FilgerMod的新属性

	spellID，iconSize，unitId，barWidth，caster，Filter 等属性均与Filger原版一样，就不说多了,不理解的请自行查阅资料

	要说的是新属性stack，即BUFF层数的显示阀值

	当BUFF的层数"大于等于"stack的值得时候，BUFF才会显示

	如果不需要控制BUFF层数阀值，请将stack设为0，或者干脆不要写stack这一项，就像下面的Test_Icon一样
	
	-- Test_Icon
	{ spellID = 67696, iconSize = 54, unitId = "player", caster = "player", Filter = "BUFF"},
	-- Test_Bar
	{ spellID = 67696, iconSize = 30, barWidth = 170 ,unitId = "player", caster = "player", Filter = "BUFF", stack = 3},
]]


----------------
--  命名空间  --
----------------

local _, SR = ...
local cfg = SR.AuraWatchConfig

SRAuraList = {

	["DRUID"] = {
		{
			Name = "PlayerBuff",
			Direction = "RIGHT",
			Interval = 6,
			Mode = "ICON",
			Pos = { "BOTTOM","oUF_SoraPlayer", "TOP", -95, 15 },
			
			--嗜血
			{ spellID =  2825, iconSize = 32, unitId = "player", caster = 	"all", Filter = "BUFF" },
			--英勇气概
			{ spellID = 32182, iconSize = 32, unitId = "player", caster = 	"all", Filter = "BUFF" },
			--节能施法
			{ spellID = 16870, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--自然之赐
			{ spellID = 16886, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--日蚀
			{ spellID = 48517, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},			
			--月蚀
			{ spellID = 48518, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--狂暴(猫&熊)
			{ spellID = 50334, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--野蛮咆哮(猫)
			{ spellID = 52610, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--时间扭曲
			{ spellID = 80353, iconSize = 32, unitId = "player", caster =	 "all", Filter = "BUFF"},
			--粉碎
			{ spellID = 80951, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--月光淋漓
			{ spellID = 81192, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--坠星
			{ spellID = 93400, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--狂暴
			{ spellID = 93622, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
		},

		{
		Name = "PlayerDebuff",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Pos = { "CENTER",nil, "CENTER", -200, 200},
			
			--变羊
			{ spellID =   118, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--制裁之锤
			{ spellID =   853, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--肾击
            { spellID =   408, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--撕扯
            { spellID = 47481, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--沉默
            { spellID = 55021, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--割碎
            { spellID = 22570, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--断筋
           { spellID =   1715, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--减速药膏
           { spellID =   3775, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
		},
		
		{
		Name = "TargetDebuff",
			Direction = "UP",
			Interval = 4,
			Mode = "BAR",
			Pos = { "BOTTOM", "oUF_SoraTarget", "TOP", -90, 5 },
			
			--挫志咆哮(熊)
			{ spellID =    99, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--回春术
			{ spellID =   774, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--割裂(猫)
			{ spellID =  1079, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--斜掠(猫)
			{ spellID =  1822, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},			
			--虫群
			{ spellID =  5570, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--月火术
			{ spellID =  8921, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--割伤(熊)
			{ spellID = 33745, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--生命绽放
			{ spellID = 33763, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},			
			--裂伤(猫)
			{ spellID = 33876, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--野蛮咆哮(猫)
			{ spellID = 52610, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--阳炎术
			{ spellID = 93402, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
		},
	},
	
	["HUNTER"] = {
		{
		Name = "PlayerBuff",
			Direction = "RIGHT",
			Interval = 6,
			Mode = "ICON",
			Pos = { "BOTTOM","oUF_SoraPlayer", "TOP", -95, 15 },

			--嗜血
			{ spellID =  2825, iconSize = 32, unitId = "player", caster = 	"all", Filter = "BUFF" },
			--英勇气概
			{ spellID = 32182, iconSize = 32, unitId = "player", caster = 	"all", Filter = "BUFF" },
			--急速射击
			{ spellID =  3045, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--野兽之心
			{ spellID = 34471, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--误导
			{ spellID = 34477, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},			
			--误导
			{ spellID = 35079, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--强化稳固射击
			{ spellID = 53220, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--眼镜蛇打击
			{ spellID = 53257, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--野性呼唤
			{ spellID = 53434, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--荷枪实弹
			{ spellID = 56453, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--攻击弱点
			{ spellID = 70728, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--时间扭曲
			{ spellID = 80353, iconSize = 32, unitId = "player", caster =	 "all", Filter = "BUFF"},
			--准备,端枪,瞄准... ...
			{ spellID = 82925, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--开火!
			{ spellID = 82926, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--上!
			{ spellID = 89388, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--血性大发
			{ spellID = 94007, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--X光瞄准
			{ spellID = 95712, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
		},

		{
		Name = "PlayerDebuff",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Pos = { "CENTER",nil, "CENTER", -200, 200},
			
			--变羊
			{ spellID =   118, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--制裁之锤
			{ spellID =   853, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--肾击
            { spellID =   408, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--撕扯
            { spellID = 47481, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--沉默
            { spellID = 55021, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--割碎
            { spellID = 22570, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--断筋
           { spellID =   1715, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--减速药膏
           { spellID =   3775, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
		},
		
		{
		Name = "TargetDebuff",
			Direction = "UP",
			Interval = 4,
			Mode = "BAR",
			Pos = { "BOTTOM", "oUF_SoraTarget", "TOP", -90, 5 },
			
			--猎人印记
			{ spellID =  1130, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--毒蛇钉刺
			{ spellID =  1978, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--驱散射击
			{ spellID = 19503, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--穿刺射击
			{ spellID = 63468, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
		},
	},
	
	["MAGE"] = {
		{
		Name = "PlayerBuff",
			Direction = "RIGHT",
			Interval = 6,
			Mode = "ICON",
			Pos = { "BOTTOM","oUF_SoraPlayer", "TOP", -95, 15 },

			--嗜血
			{ spellID =  2825, iconSize = 32, unitId = "player", caster = 	"all", Filter = "BUFF" },
			--英勇气概
			{ spellID = 32182, iconSize = 32, unitId = "player", caster = 	"all", Filter = "BUFF" },
			--奥术强化
			{ spellID = 12042, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--唤醒
			{ spellID = 12051, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--奥术冲击
			{ spellID = 36032, iconSize = 32, unitId = "player", caster = "player", Filter = "DEBUFF"},				
			--寒冰指
			{ spellID = 44544, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--法术连击
			{ spellID = 48108, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--冰冷智慧
			{ spellID = 57761, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--冲击(等级1)
			{ spellID = 64343, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--奥术飞弹!
			{ spellID = 79683, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--时间扭曲
			{ spellID = 80353, iconSize = 32, unitId = "player", caster =	 "all", Filter = "BUFF"},
			--灸灼
			{ spellID = 87023, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
		},

		{
		Name = "PlayerDebuff",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Pos = { "CENTER",nil, "CENTER", -200, 200},
			
			--变羊
			{ spellID =   118, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--制裁之锤
			{ spellID =   853, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--肾击
            { spellID =   408, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--撕扯
            { spellID = 47481, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--沉默
            { spellID = 55021, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--割碎
            { spellID = 22570, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--断筋
           { spellID =   1715, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--减速药膏
           { spellID =   3775, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
		},
		
		{
		Name = "TargetDebuff",
			Direction = "UP",
			Interval = 4,
			Mode = "BAR",
			Pos = { "BOTTOM", "oUF_SoraTarget", "TOP", -90, 5 },
			
			--点燃
			{ spellID = 12654, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--临界炽焰
			{ spellID = 22959, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--减速
			{ spellID = 31589, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--活动炸弹
			{ spellID = 44457, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
		},
	},
	
	["WARRIOR"] = {
		{
		Name = "PlayerBuff",
			Direction = "RIGHT",
			Interval = 6,
			Mode = "ICON",
			Pos = { "BOTTOM","oUF_SoraPlayer", "TOP", -95, 15 },

			--嗜血
			{ spellID =  2825, iconSize = 32, unitId = "player", caster = 	"all", Filter = "BUFF" },
			--英勇气概
			{ spellID = 32182, iconSize = 32, unitId = "player", caster = 	"all", Filter = "BUFF" },
			--盾墙(防御姿态)
			{ spellID =   871, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--怒火中烧
			{ spellID =  1134, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--盾牌格挡(防御姿态)
			{ spellID =  2565, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},			
			--横扫攻击(战斗,狂暴姿态)
			{ spellID = 12328, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--战斗专注
			{ spellID = 12964, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--破釜沉舟
			{ spellID = 12975, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--血之狂热
			{ spellID = 16491, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--反击风暴(战斗姿态)
			{ spellID = 20230, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--嗜血
			{ spellID = 23885, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--法术发射(战斗,防御姿态)
			{ spellID = 23920, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--复苏之风(等级1)
			{ spellID = 29841, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--胜利
			{ spellID = 32216, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--血脉喷张
			{ spellID = 46916, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--剑盾猛攻
			{ spellID = 50227, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--猝死
			{ spellID = 55694, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--激怒(等级2)
			{ spellID = 57519, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--血之气息
			{ spellID = 60503, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--主宰
			{ spellID = 65156, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--时间扭曲
			{ spellID = 80353, iconSize = 32, unitId = "player", caster =	 "all", Filter = "BUFF"},
			--胜利
			{ spellID = 82368, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--屠夫(等级3)
			{ spellID = 84586, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--坚守阵地
			{ spellID = 84620, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--致命平静
			{ spellID = 85730, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--激动
			{ spellID = 86627, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--雷霆余震
			{ spellID = 87096, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--行刑者
			{ spellID = 90806, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
		},	

		{
		Name = "PlayerDebuff",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Pos = { "CENTER",nil, "CENTER", -200, 200},
			
			--变羊
			{ spellID =   118, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--制裁之锤
			{ spellID =   853, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--肾击
            { spellID =   408, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--撕扯
            { spellID = 47481, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--沉默
            { spellID = 55021, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--割碎
            { spellID = 22570, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--断筋
           { spellID =   1715, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--减速药膏
           { spellID =   3775, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
		},

		{
		Name = "TargetDebuff",
			Direction = "UP",
			Interval = 4,
			Mode = "BAR",
			Pos = { "BOTTOM", "oUF_SoraTarget", "TOP", -90, 5 },
			
			--撕裂(战斗,防御姿态)
			{ spellID = 94009, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
		},
	},
	
	["SHAMAN"] = {
		{
		Name = "PlayerBuff",
			Direction = "RIGHT",
			Interval = 6,
			Mode = "ICON",
			Pos = { "BOTTOM","oUF_SoraPlayer", "TOP", -95, 25 },
			
			--嗜血
			{ spellID =  2825, iconSize = 32, unitId = "player", caster = 	"all", Filter = "BUFF" },
			--英勇气概
			{ spellID = 32182, iconSize = 32, unitId = "player", caster = 	"all", Filter = "BUFF" },
			--闪电之盾
			{ spellID =   324, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--水之护盾
			{ spellID = 52127, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--潮汐奔涌
			{ spellID = 53390, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--5层漩涡武器
			{ spellID = 53817, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF", Stack=5},
			--时间扭曲
			{ spellID = 80353, iconSize = 32, unitId = "player", caster =	 "all", Filter = "BUFF"},
		},

		{
		Name = "PlayerDebuff",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Pos = { "CENTER",nil, "CENTER", -200, 200},
			
			--变羊
			{ spellID =   118, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--制裁之锤
			{ spellID =   853, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--肾击
            { spellID =   408, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--撕扯
            { spellID = 47481, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--沉默
            { spellID = 55021, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--割碎
            { spellID = 22570, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--断筋
           { spellID =   1715, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--减速药膏
           { spellID =   3775, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
		},
		
		{
		Name = "TargetDebuff",
			Direction = "UP",
			Interval = 4,
			Mode = "BAR",
			Pos = { "BOTTOM", "oUF_SoraTarget", "TOP", -90, 5 },
			
			--灼热烈焰
			{ spellID = 77661, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--烈焰震击
			{ spellID =  8050, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
		},
	},
	
	["PALADIN"] = {
		{
		Name = "PlayerBuff",
			Direction = "RIGHT",
			Interval = 6,
			Mode = "ICON",
			Pos = { "BOTTOM","oUF_SoraPlayer", "TOP", -95, 15 },

			--嗜血
			{ spellID =  2825, iconSize = 32, unitId = "player", caster = 	"all", Filter = "BUFF" },
			--英勇气概
			{ spellID = 32182, iconSize = 32, unitId = "player", caster = 	"all", Filter = "BUFF" },
			--圣佑术
			{ spellID =   498, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--圣盾术
			{ spellID =   642, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--神恩术
			{ spellID = 31842, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},			
			--复仇之怒
			{ spellID = 31884, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--炙热防御者
			{ spellID = 31850, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--纯洁审判(等级3)
			{ spellID = 53657, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--圣光灌注(等级2)
			{ spellID = 54149, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--神圣恳求
			{ spellID = 54428, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--战争艺术
			{ spellID = 59578, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--时间扭曲
			{ spellID = 80353, iconSize = 32, unitId = "player", caster =	 "all", Filter = "BUFF"},
			--异端裁决
			{ spellID = 84963, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--黎明圣光
			{ spellID = 85222, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--狂热
			{ spellID = 85696, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--破晓
			{ spellID = 85819, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--远古列王守卫
			{ spellID = 86659, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--神圣意志
			{ spellID = 90174, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
		},

		{
		Name = "PlayerDebuff",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Pos = { "CENTER",nil, "CENTER", -200, 200},
			
			--变羊
			{ spellID =   118, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--制裁之锤
			{ spellID =   853, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--肾击
            { spellID =   408, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--撕扯
            { spellID = 47481, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--沉默
            { spellID = 55021, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--割碎
            { spellID = 22570, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--断筋
           { spellID =   1715, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--减速药膏
           { spellID =   3775, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
		},
		
		{
		Name = "TargetDebuff",
			Direction = "UP",
			Interval = 4,
			Mode = "BAR",
			Pos = { "BOTTOM", "oUF_SoraTarget", "TOP", -90, 5 },
			
			--制裁之锤
			{ spellID = 853, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--神圣愤怒
			{ spellID = 2812, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--超度邪恶
			{ spellID = 10326, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--忏悔
			{ spellID = 20066, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
		},
	},

	["PRIEST"] = {
		{
		Name = "PlayerBuff",
			Direction = "RIGHT",
			Interval = 6,
			Mode = "ICON",
			Pos = { "BOTTOM","oUF_SoraPlayer", "TOP", -95, 15 },

			--嗜血
			{ spellID =  2825, iconSize = 32, unitId = "player", caster = 	"all", Filter = "BUFF" },
			--英勇气概
			{ spellID = 32182, iconSize = 32, unitId = "player", caster = 	"all", Filter = "BUFF" },
			--消散
			{ spellID = 47585, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--争分夺秒
			{ spellID = 59888, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},			
			--妙手回春
			{ spellID = 63735, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--心灵融化
			{ spellID = 73510, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			{ spellID = 77487, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--时间扭曲
			{ spellID = 80353, iconSize = 32, unitId = "player", caster =	 "all", Filter = "BUFF"},
			--脉轮:佑
			--{ spellID = 81206, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--脉轮:静
			--{ spellID = 81208, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--脉轮:罚
			--{ spellID = 81209, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--真言术:障
			{ spellID = 81782, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--黑暗福音
			{ spellID = 87118, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--天使长
			{ spellID = 87152, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--黑暗天使长
			{ spellID = 87153, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},    
			--福音传播
			{ spellID = 81661, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--圣光涌动(等级1)
			{ spellID = 88688, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--强效暗影
			{ spellID = 95799, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
		},

		{
		Name = "PlayerDebuff",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Pos = { "CENTER",nil, "CENTER", -200, 200},
			
			--变羊
			{ spellID =   118, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--制裁之锤
			{ spellID =   853, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--肾击
            { spellID =   408, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--撕扯
            { spellID = 47481, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--沉默
            { spellID = 55021, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--割碎
            { spellID = 22570, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--断筋
           { spellID =   1715, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--减速药膏
           { spellID =   3775, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
		},
		
		{
		Name = "TargetDebuff",
			Direction = "UP",
			Interval = 4,
			Mode = "BAR",
			Pos = { "BOTTOM", "oUF_SoraTarget", "TOP", -90, 5 },
			
			--暗言术:痛
			{ spellID =   589, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--噬灵疫病
			{ spellID =  2944, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--虚弱灵魂
			{ spellID =  6788, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--吸血鬼之触
			{ spellID =  34914, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
		},
	},

	["WARLOCK"] = {
		{
		Name = "PlayerBuff",
			Direction = "RIGHT",
			Interval = 6,
			Mode = "ICON",
			Pos = { "BOTTOM","oUF_SoraPlayer", "TOP", -95, 15 },

			--嗜血
			{ spellID =  2825, iconSize = 32, unitId = "player", caster = 	"all", Filter = "BUFF" },
			--英勇气概
			{ spellID = 32182, iconSize = 32, unitId = "player", caster = 	"all", Filter = "BUFF" },
			--夜幕(等级2)
			{ spellID = 18095, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--反冲(等级3)
			{ spellID = 34939, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--小鬼增效
			{ spellID = 47283, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},			
			--灭杀(等级2)
			{ spellID = 63158, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--灭杀
			{ spellID = 63167, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--熔火之心
			{ spellID = 71165, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--时间扭曲
			{ spellID = 80353, iconSize = 32, unitId = "player", caster =	 "all", Filter = "BUFF"},
			--强化灵魂之火
			{ spellID = 85383, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--魔能火花
			{ spellID = 89937, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
		},

		{
		Name = "PlayerDebuff",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Pos = { "CENTER",nil, "CENTER", -200, 200},
			
			--变羊
			{ spellID =   118, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--制裁之锤
			{ spellID =   853, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--肾击
            { spellID =   408, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--撕扯
            { spellID = 47481, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--沉默
            { spellID = 55021, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--割碎
            { spellID = 22570, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--断筋
           { spellID =   1715, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--减速药膏
           { spellID =   3775, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
		},

		{
		Name = "TargetDebuff",
			Direction = "UP",
			Interval = 4,
			Mode = "BAR",
			Pos = { "BOTTOM", "oUF_SoraTarget", "TOP", -90, 5 },
			
			--腐蚀术
			{ spellID =   172, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--献祭
			{ spellID =   348, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--末日灾祸
			{ spellID =   603, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--暗影箭
			{ spellID =   686, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--痛苦灾祸
			{ spellID =   980, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--元素诅咒
			{ spellID =  1490, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--烧尽
			{ spellID = 29722, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--痛苦无常
			{ spellID = 30108, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--鬼影缠身
			{ spellID = 48181, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--混乱之箭
			{ spellID = 50796, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--浩劫灾祸
			{ spellID = 80240, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--古尔丹邪咒
			{ spellID = 86000, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
		},	
	},
	
	["ROGUE"] = {
		{
		Name = "PlayerBuff",
			Direction = "RIGHT",
			Interval = 6,
			Mode = "ICON",
			Pos = { "BOTTOM","oUF_SoraPlayer", "TOP", -95, 15 },

			--嗜血
			{ spellID =  2825, iconSize = 32, unitId = "player", caster = 	"all", Filter = "BUFF" },
			--英勇气概
			{ spellID = 32182, iconSize = 32, unitId = "player", caster = 	"all", Filter = "BUFF" },
			--佯攻
			{ spellID =  1966, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--切割
			{ spellID =  5171, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--嫁祸诀窍
			{ spellID = 57934, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},			
			--灭绝
			{ spellID = 58427, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--嫁祸诀窍
			{ spellID = 59628, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
			--时间扭曲
			{ spellID = 80353, iconSize = 32, unitId = "player", caster =	 "all", Filter = "BUFF"},
			--致命冲动
			{ spellID = 84590, iconSize = 32, unitId = "player", caster = "player", Filter = "BUFF"},
		},
		
		{
		Name = "PlayerDebuff",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Pos = { "CENTER",nil, "CENTER", -200, 200},
			
			--变羊
			{ spellID =   118, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--制裁之锤
			{ spellID =   853, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--肾击
            { spellID =   408, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--撕扯
            { spellID = 47481, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--沉默
            { spellID = 55021, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--割碎
            { spellID = 22570, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--断筋
           { spellID =   1715, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
			--减速药膏
           { spellID =   3775, iconSize = 54, unitId = "player", caster = "all", Filter = "DEBUFF" },
		},

		{
		Name = "TargetDebuff",
			Direction = "UP",
			Interval = 4,
			Mode = "BAR",
			Pos = { "BOTTOM", "oUF_SoraTarget", "TOP", -90, 5 },
			
			--割裂
			{ spellID =  1943, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
			--要害打击
			{ spellID = 84617, iconSize = 20, barWidth = 175 ,unitId = "target", caster = "player", Filter = "DEBUFF"},
		},
			
	},
	
	["DEATHKNIGHT"] = {
		{
			--Name = "PlayerBuff",
			Direction = "RIGHT",
			Interval = 6,
			Mode = "ICON",
			iconSize = 32,
			Pos = { "BOTTOM","oUF_SoraPlayer", "TOP", -95, 15 },
			List = {	
				--嗜血
				{ spellID =  2825, unitId = "player", Filter = "BUFF"},
				--英勇气概
				{ spellID = 32182, unitId = "player", Filter = "BUFF"},
				--利刃屏障(等级3)
				{ spellID = 64856, unitId = "player", Filter = "BUFF"},
				--反魔法护罩
				{ spellID = 48707, unitId = "player", Filter = "BUFF"},
				--冰封之韧
				{ spellID = 48792, unitId = "player", Filter = "BUFF"},			
				--巫妖之躯
				{ spellID = 49039, unitId = "player", Filter = "BUFF"},
				--白骨之盾
				{ spellID = 49222, unitId = "player", Filter = "BUFF"},
				--杀戮机器
				{ spellID = 51124, unitId = "player", Filter = "BUFF"},
				--灰烬冰川
				{ spellID = 53386, unitId = "player", Filter = "BUFF"},
				--吸血鬼之血
				{ spellID = 55233, unitId = "player", Filter = "BUFF"},
				--冰冻之雾
				{ spellID = 59052, unitId = "player", Filter = "BUFF"},
				--时间扭曲
				{ spellID = 80353, unitId = "player", Filter = "BUFF"},
				--赤色天灾
				{ spellID = 81141, unitId = "player", Filter = "BUFF"},
				--大墓地的意志
				{ spellID = 81162, unitId = "player", Filter = "BUFF"},
				--符文刃舞
				{ spellID = 81256, unitId = "player", Filter = "BUFF"},
			}
		},
		
		{
			--Name = "PlayerDebuff",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			iconSize = 32,
			Pos = { "CENTER",nil, "CENTER", -200, 200},
			List = {				
				--变羊
				{ spellID =   118, unitId = "player", Filter = "DEBUFF" },
				--制裁之锤
				{ spellID =   853, unitId = "player", Filter = "DEBUFF" },
				--肾击
				{ spellID =   408, unitId = "player", Filter = "DEBUFF" },
				--撕扯
				{ spellID = 47481, unitId = "player", Filter = "DEBUFF" },
				--沉默
				{ spellID = 55021, unitId = "player", Filter = "DEBUFF" },
				--割碎
				{ spellID = 22570, unitId = "player", cFilter = "DEBUFF" },
				--断筋
			   { spellID =   1715, unitId = "player", Filter = "DEBUFF" },
				--减速药膏
			   { spellID =   3775, unitId = "player", Filter = "DEBUFF" },
			}
		},
		
		{
			--Name = "TargetDebuff",
			Direction = "UP",
			Interval = 4,
			Mode = "BAR",
			iconSize = 16,
			barWidth = 175,
			Pos = { "BOTTOM", "oUF_SoraTarget", "TOP", 8, 5 },
			List = {
				--血之疫病
				{ spellID = 55078, unitId = "target", Filter = "DEBUFF"},
				--冰霜疫病
				{ spellID = 55095, unitId = "target", Filter = "DEBUFF"},
			}
		},
		
		{
			--Name = "CD",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			iconSize = 54,
			Pos = { "CENTER", UIParent, "CENTER", 0, 100 },
			List = {	
				--Example
				{ spellID = 57330, iconSize = 54, Filter = "CD"},
			}
		},	
	
	},
}