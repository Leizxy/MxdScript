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
MacroID=f9567de5-570a-4d36-8544-4e1f15d7e5f1
Description=菜单
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
// Left => 37; Up => 38; Right => 39; Down => 40
// F1~F12 => 112~123;
// Enter => 13;

Function getHwnd()
//查找窗口类名(MapleStoryClass)或者标题(MapleStory),返回找到的句柄Hwnd
	getHwnd = Plugin.Window.Find("MapleStoryClass", "MapleStory")
End Function

mHwnd = getHwnd()

// 拍卖券
MENU_KEY = Array("F1", 1)
// 确认按钮
CONFIRM_KEY = Array("Right", 1, "Enter", 1)
// 射手
Henesys = Array("Down", 1, "Enter", 2, "Down", 1, "Enter", 1)

// 去射手
toHenesys = Array(MENU_KEY, Henesys, CONFIRM_KEY)

Function timeMiliSeconds()
	timeMiliSeconds = (DateDiff("s", "1970/1/1 00:00:00", Now()) * 1000) + (Round((timer() - Int(timer()))*1000,0)) - T1
End Function

Function timeSeconds()
	timeSeconds = DateDiff("s","1970/01/01 00:00:00",Now())
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
'按键 cost 700ms
Function press(keyCode, txt, moreDelay)
	Delay 80
	KeyDown keyCode, 1
	Delay 80
	KeyUp keyCode, 1
	Delay 540
	Delay moreDelay
End Function

Function pressKey(keyArray, moreDelay)
	Delay 80
	KeyDown keyArray(0), 1
	Delay 80
	KeyUp keyArray(0), 1
	Delay 540
	Delay moreDelay
End Function

// 后台按键在mxd无法生效，应该是冒险岛有做拦截。
Function pressCode(code, moreDelay)
	//Call log("pressCode", "code: " & code)
	Delay 80
	'Call Plugin.Bkgnd.KeyDown(mHwnd, code)
	KeyDown code, 1
	Delay 80
	'Call Plugin.Bkgnd.KeyUp(mHwnd, code)
	KeyUp code, 1
	Delay 640
	Delay moreDelay
End Function

Function pressKeyList(list)
	Call logArray("pressKeyList", list)
	count = UBound(list)
	
	If count Mod 2 = 0 Then 
		TracePrint "list is not good."
		Goto funcEnd
	End If
	
	For i = 0 To count Step 2
		If list(i + 1) = 1 Then 
			Call pressCode(list(i), 0)
		Else
			For j = 1 To list(i + 1)
				Call pressCode(list(i), 0)
			Next
		End If
	Next
			
	Rem funcEnd
	Delay 1200
End Function

Function pressMenuGroup(list)
	c = UBound(list)
	
	Call log("pressMenuGroup", c)
	
	For i = 0 to c
		TracePrint i
		keyList = list(i)
		Call pressKeyList(keyList)
		TracePrint c
	Next
	Call log("pressMenuGroup", c)
End Function

Function transfer()
	'Call pressKey(MENU_KEY, 0)
	'Call selectMenu(Henesys)
	'Call selectMenu(CONFIRM_KEY)
	Call pressKeyList(MENU_KEY)
	Call pressKeyList(Henesys)
	Call pressKeyList(CONFIRM_KEY)
End Function

Call transfer()
