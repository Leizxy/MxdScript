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
MacroID=3f493d52-a30a-4abb-9787-3d39ffc7c310
Description=心火-new
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

Function 前置()
	Delay 1002
	KeyDown "Right", 1
	Delay 120
	KeyUp "Right", 1
	Delay 297
	KeyDown "Down", 1
	Delay 50
	KeyUp "Down", 1
	Delay 17
	KeyDown "Down", 1
	Delay 48
	KeyDown "Space", 1
	Delay 120
	KeyUp "Space", 1
	Delay 164
	KeyUp "Down", 1
End Function

Function xunhuan()
	
'==========以下是按键精灵录制的内容==========
MoveTo 1072, 564
Delay 73
KeyUp "F11", 1

Delay 1099
KeyDown "Right", 1
Delay 82
KeyDown "Space", 1
Delay 76
KeyUp "Space", 1
Delay 93
KeyUp "Right", 1
Delay 589
KeyDown "Right", 1
Delay 105
KeyDown "Space", 1
Delay 106
KeyUp "Space", 1
Delay 10
KeyUp "Right", 1
Delay 565
KeyDown "2", 1
Delay 85
KeyUp "2", 1
Delay 508
KeyDown "Left", 1
Delay 107
KeyUp "Left", 1
Delay 78
KeyDown "2", 1
Delay 79
KeyUp "2", 1
Delay 438
KeyDown "Right", 1
Delay 180
KeyUp "Right", 1
Delay 109
KeyDown "Down", 1
Delay 210
KeyDown "Space", 1
Delay 113
KeyUp "Down", 1
Delay 16
KeyUp "Space", 1
Delay 550
KeyDown "2", 1
Delay 116
KeyUp "2", 1
Delay 440
KeyDown "Left", 1
Delay 118
KeyUp "Left", 1
Delay 138
KeyDown "2", 1
Delay 91
KeyUp "2", 1
Delay 730
KeyDown "C", 1
Delay 117
KeyUp "C", 1
Delay 566
KeyDown "Down", 1
Delay 251
KeyDown "Space", 1
Delay 65
KeyUp "Down", 1
Delay 58
KeyUp "Space", 1
Delay 1084
KeyDown "Left", 1
Delay 99
KeyDown "2", 1
Delay 26
KeyUp "Left", 1
Delay 63
KeyUp "2", 1
Delay 400
KeyDown "Left", 1
Delay 305
KeyDown "Space", 1
Delay 89
KeyUp "Space", 1
Delay 47
KeyDown "Space", 1
Delay 49
KeyUp "Left", 1
Delay 12
KeyUp "Space", 1
Delay 382
KeyDown "2", 1
Delay 74
KeyUp "2", 1
Delay 397
KeyDown "Right", 1
Delay 307
KeyUp "Right", 1
Delay 75
KeyDown "Down", 1
Delay 232
KeyDown "Space", 1
Delay 139
KeyUp "Space", 1
Delay 88
KeyUp "Down", 1
Delay 244
KeyDown "Right", 1
Delay 127
KeyUp "Right", 1
Delay 50
KeyDown "2", 1
Delay 77
KeyUp "2", 1
Delay 487
KeyDown "Right", 1
Delay 386
KeyUp "Right", 1
Delay 45
KeyDown "2", 1
Delay 73
KeyUp "2", 1
Delay 599
KeyDown "Left", 1
Delay 199
KeyDown "2", 1
Delay 25
KeyUp "Left", 1
Delay 72
KeyUp "2", 1
Delay 395
KeyDown "Right", 1
Delay 512
Delay 30
KeyDown "Right", 1
Delay 32
Delay 31
KeyDown "Right", 1
Delay 31
Delay 29
KeyDown "Right", 1
Delay 47
Delay 9
KeyDown "2", 1
Delay 107
KeyUp "Right", 1
Delay 2
KeyUp "2", 1
Delay 1264
KeyDown "4", 1
Delay 126
KeyUp "4", 1
Delay 183
KeyDown "Down", 1
Delay 286
KeyDown "Space", 1
Delay 83
KeyUp "Down", 1
Delay 36
KeyUp "Space", 1
Delay 1367
KeyDown "F9", 1
'==========以上是按键精灵录制的内容==========
End Function

Call 前置()

For 100
	Call xunhuan()
Next
