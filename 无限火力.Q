[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=3aab61cb-2018-4f95-8df8-7ae92ecaaa93
Description=无限火力
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
'朝向哪边输出
mAttackToLeft = False
'默认是1，根据增益持续时间来给定。
mBuffTime = 2
//冷却
mPercentCd = 0.95
mCd = 7
'[技能按键，连按次数，技能CD，技能名称，buff持续时间，按键结束时间]
Dim SkillA
SkillA = Array("4", 3, 0.5, "御剑追击", 40 * mBuffTime - 10, 0)
Dim SkillB
SkillB = Array("2", 2, 0, "斩决", 0, 0)
Dim SkillC
SkillC = Array("c", 1, 20, "剑域", 40 * mBuffTime - 10, 0)
Dim SkillD
SkillD = Array("PageDown", 1, 40 * mPercentCd - mCd, "毁灭之剑", 0, 0)
Dim SkillE
SkillE = Array("r", 1, 180, "剑咒之印", 0, 0)
Dim SkillF
SkillF = Array("f", 1, 60 * mPercentCd - mCd, "标记", 0, 0)
Dim SkillG
SkillG = Array("w", 1, 180 * mPercentCd - mCd, "无穷之域", 20, 0)
Dim SkillH
SkillH = Array("Ctrl", 1, 90 * mPercentCd - mCd, "飓风剑", 15, 0)
Dim SkillI
SkillI = Array("r", 1, 90 * mPercentCd - mCd, "剑咒之印", 0, 0)
Dim SkillJ
SkillJ = Array("F2", 1, 200 * mPercentCd - mCd, "全速驱动", 60, 0)
Dim SkillK
SkillK = Array("Insert", 1, 7200, "专注", 5400, 0)
Dim SkillL
SkillL = Array("s", 1, 175 * mPercentCd - mCd, "力量复原", 30, 0)
Dim SkillM
SkillM = Array("e", 1, 10, "钢铁之躯", 15, 0)
Dim SkillN '240 cd 'todo 充能技能
SkillN = Array("a", 1, 30, "女神祝福", 40, 0)
Dim SkillO
SkillO = Array("g", 1, 120 * mPercentCd - mCd, "灵气武器", 140, 0)
Dim SkillP
SkillP = Array("3", 2, 1, "御剑穿刺", 60, 0)
Dim SkillQ
SkillQ = Array("`", 1, 8, "羽毛", 0, 0)
Dim SkillR
SkillR = Array("q", 3, 1.5, "触底", 0, 0)


Function timeMiliSeconds()
	timeMiliSeconds = (DateDiff("s", "1970/1/1 00:00:00", Now()) * 1000) + (Round((timer() - Int(timer()))*1000,0)) - T1
End Function

Function timeSeconds()
	timeSeconds = DateDiff("s","1970/01/01 00:00:00",Now())
End Function

Function max(a1, a2)
	If a1 > a2 Then 
		max = a1
	Else
		max = a2
	End If
End Function

Function log(tag, txt)
	TracePrint Now() & ": >" & tag & ": " & txt & ". <" & timeMiliSeconds
End Function

Function logArray(tag, array)
	count = UBound(array)
	str = "Array["
	For i = 0 To count
		If (i = count) Then
			str = str & array(i) & "]"	
		Else
			str = str & array(i) & ", "
		End If
	Next
	
	Call log(tag, str)
End Function

'总计delay 700
Function 按键(code, txt)
	Delay 80
	KeyDown code, 1
	Delay 80
	KeyUp code, 1
	Delay 540
End Function

pressTimeStep = 35
// 长按
Function 长按(code, time)
	extraTime = time - 500
	count = extraTime / pressTimeStep
	
	KeyDown code, 1
	Delay 500
	
	For i = 0 To count Step 2
		Delay pressTimeStep
		KeyDown code, 1
		Delay pressTimeStep
	Next
	
	KeyUp code, 1
End Function

Function 连续按技能(array)
	'Call logArray("连续按技能", array)
	If (timeSeconds() - array(5) > array(4)) Then 
		Call log("连续按技能", array(3))
		For array(1)
			Delay 50
			'Call 按键(array(0), array(3))
			KeyPress array(0), 1
			Delay array(2) * 1000
		Next
		array(5) = timeSeconds
		Call log("连续按技能", array(3) & " -> " & array(5))
	End If
	连续按技能 = array(5)
End Function

Function pressSkill(array)
	If array(2) > 0 Then 
		value = max(array(2), array(4))
		If (timeSeconds() - array(5) > value) Then 
			For array(1)
				Call 按键(array(0), array(3))
			Next
			array(5) = timeSeconds
			Call log("pressSkill", array(3) & " -> " & array(5) & ", value: " & value)
		End If
	Else 
		For array(1)
			Call 按键(array(0), array(3))
		Next
	End If
	
	pressSkill = array(5)
End Function

Function pressSkillFast(array)
	Call logArray("pressSkillFast", array)
	
	If array(2) > 0 Then 
		value = max(array(2), array(4))
		If (timeSeconds() - array(5) > value) Then 
			For array(1)
				KeyDown array(0), 1
				Delay 100
				KeyUp array(0), 1
				Delay 100
			Next
			array(5) = timeSeconds
			Call log("pressSkillFast", array(3) & " -> " & array(5) & ", value: " & value)
		End If
	Else 
		For array(1)
			KeyDown array(0), 1
			Delay 100
			KeyUp array(0), 1
			Delay 100
		Next
	End If
	
	pressSkillFast = array(5)
End Function

Function specialSkill()
	SkillL(5) = pressSkill(SkillL)
	KeyPress "4", 1	
End Function

Function moveLeftAndRight(left)
	If left = True Then
		Delay 100
		KeyDown "Right", 1
		Delay 200
		KeyUp "Right", 1	
		Delay 100
		KeyDown "Left", 1
		Delay 200
		KeyUp "Left", 1
		Delay 100
	Else 
		Delay 100
		KeyDown "Left", 1
		Delay 200
		KeyUp "Left", 1
		Delay 100
		KeyDown "Right", 1
		Delay 200
		KeyUp "Right", 1
		Delay 100	
	End If	
End Function

Function fangdai(isLeft)
	dirCode = "Right"
	
	If isLeft = True Then 
		dirCode = "Left"
	End If
	
	Call 长按(dirCode, 800)
	Call pressSkillFast(SkillQ)
	Call pressSkillFast(SkillR)
	Call 长按(dirCode, 700)
End Function

'输出循环
Function main()
	For i = 1 To 999999999
		SkillK(5) = pressSkill(SkillK)
		SkillM(5) = pressSkill(SkillM)
		SkillN(5) = pressSkill(SkillN)
		SkillO(5) = pressSkill(SkillO)
		Call pressSkill(SkillB)
		SkillA(5) = 连续按技能(SkillA)
		SkillC(5) = pressSkill(SkillC)
		SkillD(5) = pressSkill(SkillD)
		SkillE(5) = pressSkill(SkillE)
		SkillF(5) = pressSkill(SkillF)
		SkillG(5) = pressSkill(SkillG)
		SkillH(5) = pressSkill(SkillH)
		SkillI(5) = pressSkill(SkillI)
		SkillJ(5) = pressSkill(SkillJ)
		Call specialSkill()
		//SkillP(5) = pressSkill(SkillP)
		
		If (i Mod 10 = 0) Then
			Call moveLeftAndRight(mAttackToLeft)
			//Call fangdai(mAttackToLeft)
		End If
	Next
End Function

Call main()
//Call fangdai(mAttackToLeft)
