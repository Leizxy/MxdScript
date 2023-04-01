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
MacroID=4e7f9a87-fb87-45d2-85cb-764910ce6589
Description=»°œ˚÷√∂•
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
Function getHwnd(WindowClass, WindowTitle)
	getHwnd = Plugin.Window.Find(WindowClass, WindowTitle)
End Function
// mxd Hwnd
Function getMxdHwnd()
	getMxdHwnd = getHwnd("MapleStoryClass", "MapleStory")
End Function
Call Plugin.Window.Top(getMxdHwnd, 1)
