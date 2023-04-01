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
MacroID=6150aefd-5157-4bdb-b41d-a221d3bee424
Description=心火
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
Function xunhuan()
	KeyDown "F4", 1
	Delay 67
	KeyUp "F4", 1
	Delay 801
	KeyDown "2", 1
	Delay 99
	KeyUp "2", 1
	Delay 515
	KeyDown "Left", 1
	Delay 133
	KeyDown "Space", 1
	Delay 85
	KeyUp "Space", 1
	Delay 116
	KeyDown "Space", 1
	Delay 117
	KeyUp "Space", 1
	Delay 67
	KeyUp "Left", 1
	Delay 166
	KeyDown "2", 1
	Delay 89
	KeyUp "2", 1
	Delay 595
	KeyDown "Left", 1
	Delay 65
	KeyDown "Space", 1
	Delay 118
	KeyUp "Space", 1
	Delay 132
	KeyDown "Space", 1
	Delay 168
	KeyUp "Space", 1
	Delay 316
	KeyDown "2", 1
	Delay 97
	KeyUp "2", 1
	Delay 536
	KeyDown "Space", 1
	Delay 134
	KeyUp "Space", 1
	Delay 349
	KeyDown "2", 1
	Delay 104
	KeyUp "2", 1
	Delay 297
	KeyDown "Space", 1
	Delay 135
	KeyUp "Space", 1
	Delay 615
	KeyUp "Left", 1
	Delay 100
	KeyDown "Down", 1
	Delay 117
	KeyDown "Space", 1
	Delay 132
	KeyUp "Space", 1
	Delay 151
	KeyUp "Down", 1
	Delay 316
	KeyDown "2", 1
	Delay 67
	KeyUp "2", 1
	Delay 650
	KeyDown "Right", 1
	Delay 200
	KeyDown "2", 1
	Delay 93
	KeyUp "2", 1
	Delay 91
	KeyUp "Right", 1
	Delay 799
	KeyDown "Right", 1
	Delay 267
	KeyUp "Right", 1
	Delay 33
	KeyDown "2", 1
	Delay 85
	KeyUp "2", 1
	Delay 381
	KeyDown "Left", 1
	Delay 251
	KeyUp "Left", 1
	Delay 166
	KeyDown "Right", 1
	Delay 50
	KeyDown "Space", 1
	Delay 118
	KeyUp "Space", 1
	Delay 217
	KeyUp "Right", 1
	Delay 249
	KeyDown "Right", 1
	Delay 501
	Delay 32
	KeyDown "Right", 1
	Delay 33
	Delay 34
	KeyDown "Right", 1
	Delay 33
	Delay 33
	KeyDown "Right", 1
	Delay 34
	Delay 34
	KeyDown "Right", 1
	Delay 33
	Delay 32
	KeyDown "Right", 1
	Delay 18
	Delay 33
	KeyDown "Space", 1
	Delay 134
	KeyUp "Space", 1
	Delay 182
	KeyDown "Space", 1
	Delay 134
	KeyUp "Space", 1
	Delay 433
	KeyDown "2", 1
	Delay 9
	KeyUp "Right", 1
	Delay 85
	KeyUp "2", 1
	Delay 739
	KeyDown "Right", 1
	Delay 101
	KeyDown "Space", 1
	Delay 117
	KeyUp "Space", 1
	Delay 83
	KeyDown "Space", 1
	Delay 68
	KeyUp "Right", 1
	Delay 2
	KeyUp "Space", 1
	Delay 181
	KeyDown "Space", 1
	Delay 48
	KeyUp "Space", 1
	Delay 233
	KeyDown "Left", 1
	Delay 402
	KeyUp "Left", 1
	Delay 599
	KeyDown "C", 1
	Delay 100
	KeyUp "C", 1
	Delay 1330
	KeyDown "F9", 1
End Function

Function script()
	For 10
		Call xunhuan()
	Next
End Function

Function 心火房按键()
	'==========以下是按键精灵录制的内容==========
MoveTo 965, 585
Delay 76
KeyUp "F11", 1
Delay 649
KeyDown "Right", 1
Delay 519
Delay 16
KeyDown "Right", 1
Delay 1
KeyUp "Right", 1
Delay 165
KeyDown "2", 1
Delay 90
KeyUp "2", 1
Delay 609
KeyDown "Right", 1
Delay 51
KeyDown "Space", 1
Delay 67
KeyUp "Space", 1
Delay 150
KeyDown "Space", 1
Delay 101
KeyUp "Space", 1
Delay 216
KeyUp "Right", 1
Delay 132
KeyDown "Left", 1
Delay 100
KeyUp "Left", 1
Delay 550
KeyDown "Left", 1
Delay 68
KeyUp "Left", 1
Delay 533
KeyDown "C", 1
Delay 92
KeyUp "C", 1
Delay 558
KeyDown "2", 1
Delay 99
KeyUp "2", 1
Delay 117
KeyDown "2", 1
Delay 68
KeyUp "2", 1
Delay 733

Call script()

'==========以上是按键精灵录制的内容==========
End Function

