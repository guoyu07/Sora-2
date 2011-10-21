﻿if GetLocale() ~= "zhTW" then return end

local L

------------------------
--  Conclave of Wind  --
------------------------
L = DBM:GetModLocalization("Conclave")

L:SetGeneralLocalization({
	name 				= "風之議會"
})

L:SetWarningLocalization({
	warnSpecial			= "颶風/微風/冰雨風暴啟動",--Special abilities hurricane, sleet storm, zephyr(which are on shared cast/CD)
	specWarnSpecial			= "特別技能啟動!",
	warnSpecialSoon			= "10秒後 特別技能啟動!"
})

L:SetTimerLocalization({
	timerSpecial			= "特別技能冷卻",
	timerSpecialActive		= "特別技能啟動"
})

L:SetOptionLocalization({
	SoundWOP = "為重要技能播放額外的警告語音",
	SoundWest = "為西風首領播放額外的警告語音",
	SoundEast = "為東風首領播放額外的警告語音",
	warnSpecial			= "當颶風/微風/冰雨風暴施放時顯示警告",--Special abilities hurricane, sleet storm, zephyr(which are on shared cast/CD)
	specWarnSpecial			= "當特別技能施放時顯示特別警告",
	timerSpecial			= "為特別技能冷卻顯示計時器",
	timerSpecialActive		= "為特別技能持續時間顯示計時器",
	warnSpecialSoon			= "特別技能施放前10秒顯示預先警告",
	OnlyWarnforMyTarget		= "只為當前或焦點目標顯示警告\n(隱藏所有其他。這包括進入戰鬥)"
})

L:SetMiscLocalization({
	gatherstrength			= "開始從剩下的風領主那裡取得力量!",
	Anshal				= "西風領主安蕭爾",
	Nezir				= "北風領主涅茲爾",
	Rohash				= "東風領主洛哈許"
})

---------------
--  Al'Akir  --
---------------
L = DBM:GetModLocalization("AlAkir")

L:SetGeneralLocalization({
	name 				= "奧拉基爾"
})

L:SetWarningLocalization({
	warnMovingPosition		= "集中位置：%s",
	WarnAdd				= "風暴小怪 即將到來"
})

L:SetTimerLocalization({
	TimerFeedback 			= "回饋 (%d)",
	TimerAddCD		= "下一個小風暴"
})

L:SetOptionLocalization({
	SoundWOP = "為重要技能播放額外的警告語音",
	warnMovingPosition	= "三階段雲層出現時提醒玩家應該移動的對應首領身體的位置",
	LightningRodIcon		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(89668),
	TimerFeedback			= "為$spell:87904的持續時間顯示計時器",
	WarnAdd			= "當小風暴出現時顯示警告",
	TimerAddCD		= "為下一個小風暴出現顯示計時器",
	RangeFrame		= "當中了$spell:89668時顯示距離框(20碼)"
})

L:SetMiscLocalization({
	Cloudone      = "頭部頂端",
	Cloudtwo			= "脖子雙肩",
	Cloudthree		= "胸部寶珠上方",
	Cloudfour		= "胸部寶珠下方",
	Cloudfive		= "底部深色雲層上方",
	Cloudsix		= "底部深色雲層中間",
	summonAdd		=	"風暴啊!我召喚你們來我身邊!",
	phase3			=	"夠了!我不要再被束縛住了!"
})