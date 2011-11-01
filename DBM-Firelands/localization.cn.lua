﻿if GetLocale() ~= "zhCN" then return end
local L

-----------------
-- Beth'tilac --
-----------------
L= DBM:GetModLocalization(192)

L:SetWarningLocalization({
})

L:SetTimerLocalization({
	TimerSpinners 		= "下一次 烬网织网蛛",
	TimerSpiderlings	= "下一次 烬网幼蛛",
	TimerDrone		= "下一次 烬网工虫"
})

L:SetOptionLocalization({
	SoundWOP = "为重要技能播放额外的警告语音",
	TimerSpinners		= "为下一次$journal:2770出现显示计时条",
	TimerSpiderlings	= "为下一次$journal:2778出现显示计时条",
	TimerDrone		= "为下一次$journal:2773出现显示计时条",
	SetIconOnFixate   = DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(99559),
	RangeFrame	= "显示距离框(10码)"
})

L:SetMiscLocalization({
	EmoteSpinners 	= "烬网织网蛛爬下来了！",
	EmoteSpiderlings 	= "幼蛛从巢穴里爬出来了！"
})

-------------------
-- Lord Rhyolith --
-------------------
L= DBM:GetModLocalization(193)

L:SetWarningLocalization({
})

L:SetTimerLocalization({
})

L:SetOptionLocalization({
	SoundWOP = "为重要技能播放额外的警告语音"
})

L:SetMiscLocalization({
	yellPhase2			= "我已经沉睡了无数的时光，现在却被这些血肉生灵所扰……你们将燃烧殆尽！"
})

---------------
-- Alysrazor --
---------------
L= DBM:GetModLocalization(194)

L:SetWarningLocalization({
	WarnPhase		= "阶段 %d",
	WarnNewInitiate		= "炽炎之爪新兵 (%s) 出现"
})

L:SetTimerLocalization({
	TimerPhaseChange	= "阶段 %d",
	TimerHatchEggs		= "下次熔火之卵孵化",
	timerNextInitiate	= "下次炽炎之爪新兵 (位置-%s)",
	TimerCombatStart	= "战斗开始"
})

L:SetOptionLocalization({
	SoundWOP = "为重要技能播放额外的警告语音",
	TimerCombatStart	= "为战斗开始显示计时条",
	WarnPhase		= "为每次转换阶段显示警告",
	WarnNewInitiate		= "为新的炽炎之爪新兵出现显示警告",
	timerNextInitiate	= "为下次炽炎之爪新兵出现显示计时条",
	TimerPhaseChange	= "为下次阶段转换显示计时条",
	TimerHatchEggs		= "为下次熔火之卵孵化显示计时条",
	InfoFrame		= "在信息框架显示熔火之羽"
})

L:SetMiscLocalization({
	YellPull		= "凡人们，我现在侍奉新的主人！",
	Initiate		= "炽炎之爪新兵",--http://www.wowhead.com/npc=53896
	YellPhase2		= "天空，归我统治！",
	FullPower		= "spell:99925",--This is in the emote, shouldn't need localizing, just msg:find
	LavaWorms		= "熔岩火虫从地下涌出来了！",--Might use this one day if i feel it needs a warning for something. Or maybe pre warning for something else (like transition soon)
	PowerLevel		= "熔火之羽",
	East			= "东面",
	West			= "西面",
	Both			= "两侧"
})

-------------
-- Shannox --
-------------
L= DBM:GetModLocalization(195)

L:SetWarningLocalization({
})

L:SetTimerLocalization({
})

L:SetOptionLocalization({
	SoundWOP = "为重要技能播放额外的警告语音",
	InfoFrame			= "在信息框显示$spell:99937的堆叠层数",
	SetIconOnFaceRage	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(99945),
	SetIconOnRage		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(100415)
})

L:SetMiscLocalization({
	Riplimb		= "裂肢",
	Rageface	= "狂脸"
})

-------------
-- Baleroc --
-------------
L= DBM:GetModLocalization(196)

L:SetWarningLocalization({
	warnStrike	= "%s (%d)",
	SpecWarnHealerTouched	= "治疗 %s 感染磨难！注意帮加和自保！"
})

L:SetTimerLocalization({
	timerStrike			= "下一次 %s",
	TimerBladeActive	= "%s",
	TimerBladeNext		= "下一次 强化剑刃"
})

L:SetOptionLocalization({
	SoundWOP = "为重要技能播放额外的警告语音",
	SpecWarnHealerTouched	= "当治疗被传染磨难后显示特别警告",
	ResetShardsinThrees	= "每3波(25人)/2波(10人)碎片出现后重置$spell:99259计数",
	warnStrike			= "为毁灭打击或地狱火攻击显示警告",
	timerStrike			= "为下一次毁灭打击或地狱火攻击显示计时条",
	TimerBladeActive	= "为当前强化的剑刃显示持续时间计时条",
	TimerBladeNext		= "为下一次毁灭之刃或地狱火之刃显示计时条",
	SetIconOnCountdown	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(99516),
	SetIconOnTorment	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(100232),
	ArrowOnCountdown	= "当你中了$spell:99516时显示DBM箭头",
	InfoFrame		= "在信息框架显示活力火花(治疗)/磨难(其他职业)的堆叠层数",
	RangeFrame			= "为$spell:99404显示距离框(5码)"
})

L:SetMiscLocalization({
	VitalSpark		= GetSpellInfo(99262).." 层数"
})

--------------------------------
-- Majordomo Fandral Staghelm --
--------------------------------
L= DBM:GetModLocalization(197)

L:SetWarningLocalization({
})

L:SetTimerLocalization({
	timerNextSpecial	= "下一次 %s (%d)"
})

L:SetOptionLocalization({
	SoundWOP = "为重要技能播放额外的警告语音",
	timerNextSpecial			= "为下一次变身特别技能显示计时条",
	RangeFrameSeeds				= "为$spell:98450显示距离框(12码)",
	RangeFrameCat				= "为$spell:98374显示距离框(10码)",
	LeapArrow					= "当$spell:98476在你附近时显示DBM箭头",
	InfoFrame			= "在信息框显示燃烧之球的堆叠层数",
	IconOnLeapingFlames			= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(100208)
})

L:SetMiscLocalization({
})

--------------
-- Ragnaros --
--------------
L= DBM:GetModLocalization(198)

L:SetWarningLocalization({
	warnRageRagnarosSoon	= "5秒后 %s 于 %s",--Spellname on targetname
	warnSplittingBlow		= "%s 在 %s",--Spellname in Location
	warnEngulfingFlame		= "%s 在 %s",--Spellname in Location
	WarnRemainingAdds		= "剩余 %d 烈焰之子",
	warnAggro				= "你是熔岩元素的目标",
	warnNoAggro				= "你不是熔岩元素的目标",
	warnEmpoweredSulf		= "5秒后 %s"--The spell has a 5 second channel, but tooltip doesn't reflect it so cannot auto localize
})

L:SetTimerLocalization({
	timerRageRagnaros		= "%s 于 %s",--Spellname on targetname
	TimerPhaseSons		= "转换阶段结束"
})

L:SetOptionLocalization({
	SoundWOP = "为重要技能播放额外的警告语音",
	SoundBB = "为泡泡队员播放恐惧之焰和豪雨的警告语音",
	warnRageRagnarosSoon		= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.prewarn:format(101109, GetSpellInfo(101109)),
	warnSplittingBlow	= "为$spell:100877的落点位置显示报警",
	warnEngulfingFlame	= "为$spell:99171的落点位置显示报警",
	WarnRemainingAdds	= "在转换阶段显示烈焰之子剩余数量",
	ElementalAggroWarn	= "警告自身是否成为熔岩元素的目标",
	warnEmpoweredSulf			= DBM_CORE_AUTO_ANNOUNCE_OPTIONS.cast:format(100997, GetSpellInfo(100997)),
	timerRageRagnaros			= DBM_CORE_AUTO_TIMER_OPTIONS.cast:format(101109, GetSpellInfo(101109)),
	TimerPhaseSons		= "为\"烈焰之子阶段\"显示持续时间计时条",
	P4IconRangeFilter			= "第4阶段的距离监视框只显示有团队标记的队员\n(需启用距离监视)",
	RangeFrame			= "显示距离监视框",
	InfoHealthFrame		= "在信息框架显示生命值(小于100k血量)",
	MeteorFrame			= "在信息框架显示$spell:99849的目标",
	AggroFrame			= "在信息框架显示没有被熔岩元素攻击的队员",
	BlazingHeatIcons	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(100983)
})

L:SetMiscLocalization({
	East				= "右侧位置",
	West				= "左侧位置",
	Middle				= "中间位置",
	North				= "近战位置",
	South				= "远程位置",
	HealthInfo			= "血量不足100k",
	HasNoAggro			= "非熔岩元素目标",
	MeteorTargets		= "陨石目标!",--Keep rollin' rollin' rollin' rollin'.
	TransitionEnded1	= "够了！我会亲自解决。",--More reliable then adds method.
	TransitionEnded2	= "萨弗拉斯将会是你的末日。",--More reliable then adds method.
	TransitionEnded3	= "跪下吧，凡人们！一切都结束了。",
	Defeat			= "太早了！……你们来得太早了……",
	Phase4				= "太早了……"
})

-----------------------
--  Firelands Trash  --
-----------------------
L = DBM:GetModLocalization("FirelandsTrash")

L:SetGeneralLocalization({
	name = "火焰之地小怪"
})

L:SetWarningLocalization({
})

L:SetTimerLocalization({
})

L:SetOptionLocalization({
	TrashRangeFrame	= "为$spell:100012显示距离框(10码)"
})

L:SetMiscLocalization({
})

----------------
--  Volcanus  --
----------------
L = DBM:GetModLocalization("Volcanus")

L:SetGeneralLocalization({
	name = "沃卡纳斯"
})

L:SetWarningLocalization({
	warnRootsDispel		=	 "阴燃根须！注意！等践踏完毕再驱散！"
})

L:SetTimerLocalization({
	timerStaffTransition	= "转换阶段结束"
})

L:SetOptionLocalization({
	warnRootsDispel		=	 "为$spell:100146显示报警",
	timerStaffTransition	= "为转换阶段持续时间显示计时条"
})

L:SetMiscLocalization({
	StaffEvent			= "%S+的触摸令诺达希尔的分枝产生了强烈反应！",--Reg expression pull match
	StaffTrees			= "烈焰树人从地下涌出，来协助保护者了！",--Might add a spec warning for this later.
	StaffTransition		= "受折磨的保护者身上一直燃烧着的火焰熄灭了！"
})
