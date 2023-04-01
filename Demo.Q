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
loginPath = "D:\mxd\冒险岛online\晴空冒险岛[云].exe"
checkMinute = 1	//检查时间-分

// 相对于窗口位置的坐标，通过抓抓工具确定
// login
连接 = Array(615, 180)
启动游戏 = Array(180, 375)
取消 = Array(395, 280)
登录账号 = Array(320, 375)
// mxd
大区 = Array(515, 200)
服务器 = Array(945, 50)
// todo add 其他频道
Channel01 = Array(370, 305)// 点2下
开始游戏 = Array(915, 550)

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

// 晴空登录器Hwnd
Function getLoginHwnd()
	getLoginHwnd = getHwnd("WTWindow", "晴空冒险岛.exe")
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
	Call leftClickSingle(convertWindowPos(getLoginHwnd, 连接), 1500, "连接")
	Call leftClickSingle(convertWindowPos(getLoginHwnd, 启动游戏), 100000, "启动游戏")
	Call leftClickSingle(convertWindowPos(getMxdHwnd, 大区), 5000, "大区")
	Call leftClickSingle(convertWindowPos(getLoginHwnd, 取消), 1000, "取消")
	Call leftClickSingle(convertWindowPos(getLoginHwnd, 登录账号), 20000, "登录账号")
	Call leftClickSingle(convertWindowPos(getMxdHwnd, 服务器), 1500, "服务器")
	Call leftClickPos(convertWindowPos(getMxdHwnd, Channel01), 2, 1500, "Channel01")
	Call leftClickSingle(convertWindowPos(getMxdHwnd, 开始游戏), 1500, "开始游戏")
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
		Call Lib.系统.结束进程("MapleStory.exe")
		Call Lib.系统.结束进程("晴空冒险岛.exe")
		Call Lib.系统.结束进程("晴空冒险岛[云].exe")
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
