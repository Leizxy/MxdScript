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
MacroID=09a6d7e9-15b9-4791-91d6-114dba92e28c
Description=All(todo)
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
checkMinute = 210	//检查时间-分

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
// 
清屏点击 = Array(680, 25)

// =======  lib ==========
'###密码识别库加载
p1 = Array(0,0)
p2 = Array(2560, 1440)
people1 = Array(0, 0)
people2 = Array(2560, 1440)
房间已经有人= "people"

Sub OnScriptLoad()
	need_ver = "3.1233"
	set ws=createobject("Wscript.Shell")
	ws.run "regsvr32 atl.dll /s"
	set ws=nothing
	PutAttachment "c:\test_game","*.*"
	PutAttachment ".\Plugin" ,"RegDll.dll"
	Call Plugin.RegDll.Reg("c:\test_game\dm.dll") 
	set dm = createobject("dm.dmsoft")
	ver = dm.Ver()
	if ver <> need_ver then
		set dm = nothing
		set ws=createobject("Wscript.Shell")
		ws.run "regsvr32 c:\test_game\dm.dll /s"
		set ws=nothing
		Delay 1500  
		set dm = createobject("dm.dmsoft")
		ver = dm.Ver()
		if ver <> need_ver then
			messagebox "插件版本错误,当前使用的版本是:"&ver&",插件所在目录是:"&dm.GetBasePath()
			messagebox "请关闭程序,重新打开本程序再尝试"
    			endscript
  		end if
	End If
End Sub

Sub inputPassword()
	Delay 4000
	set dm = createobject("dm.dmsoft")
	base_path = dm.GetBasePath()
	dm_ret = dm.SetPath(base_path)
	dm_ret = dm.SetDict(0,"num.txt")
	pwd = dm.Ocr(p1(0), p1(1), p2(0), p2(1), "ff0000-000000", 1.0)
	
	For i=1 to 4 
		tmp = mid(pwd, i, 1)
		KeyPress tmp, 1
		Delay 50
	Next
	
	KeyPress "Enter", 1
	Delay 4000
End Sub

Function 房间是否有人()
	Set dm = createobject("dm.dmsoft")
	base_path = dm.GetBasePath()
	dm_ret = dm.SetPath(base_path)
	dm_ret = dm.SetDict(0,"people.txt")
	s = dm.Ocr(people1(0), people1(1), people2(0), people2(1), "ffffff-000000|ffffff-000000", 1.0)
	
	If 房间已经有人 = s Then 
		房间是否有人 = True
	Else 
		房间是否有人 = False
	End If
End Function

// =======  lib ==========

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
	TracePrint Now & ": << leftClick(" & pos(0) & ", " & pos(1) & "), " & txt & " >> " & "will delay " & delayTime & "ms --- " & timeSeconds
	Delay delayTime
End Function

Function leftClickSingle(pos, delayTime, txt)
	Call leftClickPos(pos, 1, delayTime, txt)
End Function

// =======  base function =========

// =======    重登    =============
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
	Call leftClickSingle(convertWindowPos(getLoginHwnd, 启动游戏), 60000, "启动游戏")
	Call leftClickSingle(convertWindowPos(getMxdHwnd, 大区), 5000, "大区")
	Call leftClickSingle(convertWindowPos(getLoginHwnd, 取消), 1000, "取消")
	Call leftClickSingle(convertWindowPos(getLoginHwnd, 登录账号), 20000, "登录账号")
	Call leftClickSingle(convertWindowPos(getMxdHwnd, 服务器), 1500, "服务器")
	Call leftClickPos(convertWindowPos(getMxdHwnd, Channel01), 2, 1500, "Channel01")
	Call leftClickSingle(convertWindowPos(getMxdHwnd, 开始游戏), 1500, "开始游戏")
	Call log("openMxd", "finish")
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
// =======    重登    =============

// =======    按键    =============
Function press(keyCode, moreDelay)
	Delay 80
	KeyDown keyCode, 1
	Delay 80
	KeyUp keyCode, 1
	Delay 540
	Delay moreDelay
End Function

Function pressKeyList(list, startDelay)
	Delay startDelay	
	Call logArray("pressKeyList", list)
	count = UBound(list)
	
	If count Mod 2 = 0 Then 
		TracePrint "list is not good."
		Goto funcEnd
	End If
	
	For i = 0 To count Step 2
		If list(i + 1) = 1 Then 
			Call press(list(i), 50)
		Else
			For j = 1 To list(i + 1)
				Call press(list(i), 50)
			Next
		End If
	Next
			
	Rem funcEnd
End Function

Function pressKeyListSimple(list)
	Call pressKeyList(list, 1000)
End Function
// =======    按键    =============

// =======    菜单    =============
// todo 结合鼠标点击
// 换线
换线 = Array("Esc", 1, "Enter", 1, "Right", 1, "Enter", 1)
// 拍卖券
菜单 = Array("F1", 1)
// 确认按钮
确认键 = Array("Right", 1, "Enter", 1)
// Enter
Enter = Array("Enter", 1)
// 射手
射手 = Array("Down", 1, "Enter", 2, "Down", 1, "Enter", 1)
// 每日福利
每日福利 = Array("Down", 2, "Enter", 1)
// 在线奖励
在线奖励 = Array("Down", 5, "Enter", 1)
// 证物领取
证物领取 = Array("Down", 15, "Enter", 1)
// 材料房
材料房 = Array("Down", 12, "Enter", 1)
// 铁板房
铁板房 = Array("Down", 4, "Enter", 1)
// 心火房
心火房 = Array("Down", 6, "Enter", 1)
// 羽毛房
羽毛房 = Array("Down", 7, "Enter", 1)

// 清屏
Function clearGameWindow()
	Call press("Esc", 500)
	Call leftClickSingle(convertWindowPos(getLoginHwnd, 清屏点击), 1500, "清屏点击")
End Function

Function 回自由(endDelay)
	Call pressKeyList(菜单, 2000)
	Call pressKeyListSimple(Enter)
	Delay endDelay
End Function

Function 确认(endDelay)
	Delay 800
	Call pressKeyListSimple(确认键)
	Delay endDelay
End Function

Function 去射手(endDelay)
	Call pressKeyList(菜单, 2000)
	Call pressKeyListSimple(射手)
	Call 确认(endDelay)
End Function

Function 打开每日福利()
	Call pressKeyList(菜单, 2000)
	Call pressKeyListSimple(每日福利)	
End Function

Function 打开材料房()
	Call 打开每日福利()
	Call pressKeyListSimple(材料房)
End Function

Function 去枫叶房(endDelay)
	Call 打开材料房()
	Call pressKeyListSimple(Enter)
	Call inputPassword()
	Delay endDelay
End Function

Function 去铁板房(endDelay)
	Call 打开材料房()
	Call pressKeyListSimple(铁板房)
	Call inputPassword()
	Delay endDelay
End Function

Function 去心火房(endDelay)
	Call 打开材料房()
	Call pressKeyListSimple(心火房)
	Call inputPassword()
	Delay endDelay
End Function

Function 去羽毛房(endDelay)
	Call 打开材料房()
	Call pressKeyListSimple(羽毛房)
	Call inputPassword()
	Delay endDelay
End Function

Function 领取证物(endDelay)
	Call 打开每日福利()
	Call pressKeyListSimple(证物领取)
	Call 确认(endDelay)
End Function

Function 领取在线奖励(endDelay)
	Call 打开每日福利()
	Call pressKeyListSimple(在线奖励)
	// todo 
End Function

Function 开始换线()
	Call log("开始换线", " ")
	Call clearGameWindow()
	Call pressKeyListSimple(换线)
	Delay 8000
End Function
// =======    菜单    =============


// =======    刷图    =============
刷枫叶次数 = 6
当前枫叶次数 = 0

Function 开始刷枫叶()
	
End Function

// todo add checkmxd
Function 刷枫叶()	
	While 当前刷枫叶次数 < 刷枫叶次数
    	Call 去枫叶房(1500)
			
		If 房间是否有人() = True Then 
			Call 开始换线()
		End If
		
		当前枫叶次数 = 当前枫叶次数 + 1
		Call 开始刷枫叶()
		TracePrint "当前枫叶次数: " & 当前枫叶次数
		Call log("刷枫叶", "当前枫叶次数: " & 当前枫叶次数)
	Wend
End Function
// =======    刷图    =============

// main
Function main()
	//Call check(30)
	Call Plugin.Window.Active(getMxdHwnd)
	//todo clear
	Call clearGameWindow()
	// todo
	//Call 回自由(1500)
	//Call 去射手(1500)
	//Call 领取证物(1500)
	//Call 去枫叶房(1500)
	//Call 去铁板房(1500)
	//Call 去心火房(1500)
End Function

Call 刷枫叶()
