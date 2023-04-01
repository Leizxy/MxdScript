[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=7
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=70312147-278d-47a9-b3c8-4fda8c2bae69
Description=Demo
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
loginPath = "D:\mxd\ð�յ�online\���ð�յ�[��].exe"
checkMinute = 1	//���ʱ��-��

// ����ڴ���λ�õ����꣬ͨ��ץץ����ȷ��
// login
���� = Array(615, 180)
������Ϸ = Array(180, 375)
ȡ�� = Array(395, 280)
��¼�˺� = Array(320, 375)
// mxd
���� = Array(515, 200)
������ = Array(945, 50)
// todo add ����Ƶ��
Channel01 = Array(370, 305)// ��2��
��ʼ��Ϸ = Array(915, 550)

// =======  base function ==========
Function timeMiliSeconds()
	timeMiliSeconds = (DateDiff("s", "1970/1/1 00:00:00", Now()) * 1000) + (Round((timer() - Int(timer()))*1000,0)) - T1
End Function

Function timeSeconds()
	timeSeconds = DateDiff("s","1970/01/01 00:00:00",Now())
End Function

Function log(tag, txt)
	TracePrint Now() & ": >> " & tag & ": " & txt & ". <<" & timeMiliSeconds
End Function

Function getHwnd(WindowClass, WindowTitle)
	getHwnd = Plugin.Window.Find(WindowClass, WindowTitle)
End Function

Function getClientRect(hwnd)
	getClientRect = Plugin.Window.GetClientRect(hwnd)
End Function

Function getClientPos(hwnd)
	winRect = Plugin.Window.GetClientRect(hwnd)
	winRectArray = Split(winRect, "|")	
	getClientPos = Array(winRectArray(0), winRectArray(1))
End Function

Function leftClickPos(pos, count, delayTime, txt)
	MoveTo pos(0), pos(1)
	LeftClick count
	//TracePrint Now & ": end < leftClick(" & pos(0) & ", " & pos(1) & "), " & txt & " > " & timeSeconds
	TracePrint Now & ": < leftClick(" & pos(0) & ", " & pos(1) & "), " & txt & " > " & "will delay " & delayTime & "ms --- " & timeSeconds
	Delay delayTime
End Function

Function leftClickSingle(pos, delayTime, txt)
	Call leftClickPos(pos, 1, delayTime, txt)
End Function

// =======  base function ==========

// mxd Hwnd
Function getMxdHwnd()
	getMxdHwnd = getHwnd("MapleStoryClass", "MapleStory")
End Function

// ��յ�¼��Hwnd
Function getLoginHwnd()
	getLoginHwnd = getHwnd("WTWindow", "���ð�յ�.exe")
End Function

Function isDisConnected()
	If getMxdHwnd() = 0 Then 
		isDisConnected = True
	Else 
		isDisConnected = False
	End If
End Function

Function convertWindowPos(hwnd, p)
	Call Plugin.Window.Active(hwnd)
	winPos = getClientPos(hwnd)
	convertWindowPos = Array(winPos(0) + p(0), winPos(1) + p(1))
End Function

Function openMxd()
	Call log("openMxd", "start " & loginPath)
	RunApp loginPath
	Delay 8000
	Call leftClickSingle(convertWindowPos(getLoginHwnd, ����), 1500, "����")
	Call leftClickSingle(convertWindowPos(getLoginHwnd, ������Ϸ), 100000, "������Ϸ")
	Call leftClickSingle(convertWindowPos(getMxdHwnd, ����), 5000, "����")
	Call leftClickSingle(convertWindowPos(getLoginHwnd, ȡ��), 1000, "ȡ��")
	Call leftClickSingle(convertWindowPos(getLoginHwnd, ��¼�˺�), 20000, "��¼�˺�")
	Call leftClickSingle(convertWindowPos(getMxdHwnd, ������), 1500, "������")
	Call leftClickPos(convertWindowPos(getMxdHwnd, Channel01), 2, 1500, "Channel01")
	Call leftClickSingle(convertWindowPos(getMxdHwnd, ��ʼ��Ϸ), 1500, "��ʼ��Ϸ")
	Call log("openMxd", "finish")
	Delay 10000
	// adele
	KeyPress "shift", 1
	Delay 2000
	KeyPress "x", 1
	Delay 1000
End Function

Function checkOrOpenMxd()
	If isDisConnected Then 
		Call Lib.ϵͳ.��������("MapleStory.exe")
		Call Lib.ϵͳ.��������("���ð�յ�.exe")
		Call Lib.ϵͳ.��������("���ð�յ�[��].exe")
		Call openMxd()
	End If
End Function

Function check(stepSecond)
	Dim i
	i = 1   
	While i > 0
		Call log("check", "while count: " & i & ", stepTime; " & stepSecond & "s")
		i = i + 1
    	Call checkOrOpenMxd()
    	
    	minOfDay = Hour(Now) * 60 + Minute(Now)
    	    	
    	If minOfDay >= checkMinute And Hour(Now) < 15 Then 
    		i = 0
			TracePrint "check ok"
    	Else 
    		Delay stepSecond * 1000
    	End If    	
	Wend	
End Function


Function main()
	Call check(30)
	// todo
	Call Plugin.Window.Active(getMxdHwnd)
	
	Delay 5000
	KeyPress "F10", 1	
End Function

Call main()