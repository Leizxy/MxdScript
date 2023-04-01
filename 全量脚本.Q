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
MacroID=99222a0a-009f-4423-80ed-51695dff61e2
Description=全量脚本
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=1
QUI=Form1
[Relative]
SetupOCXFile=
[Comment]

[Script]
'##全局变量，用于控制各个脚本次数
p1 = Array(0,0)
p2 = Array(2560, 1440)
people1 = Array(0, 0)
people2 = Array(2560, 1440)
枫叶刷图次数 = 6
枫叶刷图时间 = 31

铁板刷图次数 = 6
铁板刷图时间 = 31

心火刷图次数 = 6
心火刷图时间 = 31

升级刷图次数 = 0
升级刷图时间 = 6

寻宝次数 = 11
跑环次数 = 0

前置延时 = 0
//前置延时 = 5.5 * 60 * 60 * 1000

'### 常量
YES = 1
NO = 2

当前枫叶次数 = 0
当前铁板次数 = 0
当前心火次数 = 0
当前寻宝次数 = 0
当前跑环次数 = 0
当前升级次数 = 0
房间已经有人= "people"
'###按键封装
Function 毫秒级时间戳()
    毫秒级时间戳 = (DateDiff("s","1970/1/1 00:00:00",Now())*1000)+(Round((timer() - Int(timer()))*1000,0))-T1
End Function
'
Function 连续按技能(code, times, cd, txt)
    For times
        Delay 50
        KeyPress code, 1
        'TracePrint "连续按技能：" & txt & ": " & 毫秒级时间戳()
        Delay cd
    Next
End Function

Dim mCurrentTime
mCurrentTime = 0
Function 御剑追击()
    timeStep = 毫秒级时间戳() - mCurrentTime
    'TracePrint "御剑追击: " & timeStep
	
    If timeStep > 40000 Then 
        Call 连续按技能(52, 3, 500, "御剑追击")
        mCurrentTime = 毫秒级时间戳()
    End If
End Function

'###密码识别库加载
'==========以下是按键精灵录制的内容=====,u====
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

Sub 输入密码()
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

Function 判断房间有人()
    Set dm = createobject("dm.dmsoft")
    base_path = dm.GetBasePath()
    dm_ret = dm.SetPath(base_path)
    dm_ret = dm.SetDict(0,"people.txt")
    s = dm.Ocr(people1(0), people1(1), people2(0), people2(1), "ffffff-000000|ffffff-000000", 1.0)
    If 房间已经有人 = s Then 
        判断房间有人 = YES
    Else 
        判断房间有人 = NO
    End If
End Function

Function 判断进图次数(当前次数, 最大次数)
    If 当前次数 < 最大次数 Then
        判断进图次数 = YES
    Else 
        判断进图次数 = NO
    End If
End Function

Function 进入枫叶图()
    Delay 1000
    Call 打开菜单()
    Delay 483
    KeyDown "Down", 1
    Delay 100
    KeyUp "Down", 1
    Delay 150
    KeyDown "Down", 1
    Delay 101
    KeyUp "Down", 1
    Delay 350
    KeyDown "Enter", 1
    Delay 95
    KeyUp "Enter", 1
    Delay 522
    KeyDown "Down", 1
    Delay 99
    KeyUp "Down", 1
    Delay 167
    KeyDown "Down", 1
    Delay 83
    KeyUp "Down", 1
    Delay 185
    KeyDown "Down", 1
    Delay 67
    KeyUp "Down", 1
    Delay 333
    KeyDown "Down", 1
    Delay 67
    KeyUp "Down", 1
    Delay 183
    KeyDown "Down", 1
    Delay 84
    KeyUp "Down", 1
    Delay 200
    KeyDown "Down", 1
    Delay 83
    KeyUp "Down", 1
    Delay 451
    KeyDown "Down", 1
    Delay 83
    KeyUp "Down", 1
    Delay 362
    KeyDown "Down", 1
    Delay 39
    KeyUp "Down", 1
    Delay 366
    KeyDown "Down", 1
    Delay 84
    KeyUp "Down", 1
    Delay 336
    KeyDown "Down", 1
    Delay 86
    KeyUp "Down", 1
    Delay 379
    KeyDown "Down", 1
    Delay 65
    KeyUp "Down", 1
    Delay 300
    KeyDown "Down", 1
    Delay 85
    KeyUp "Down", 1
    Delay 466
    KeyDown "Enter", 1
    Delay 67
    KeyUp "Enter", 1
    Delay 1269
    KeyDown "Enter", 1
    Delay 99
    KeyUp "Enter", 1
    Delay 2000
    //Call 输入密码()
End Function

Function 刷枫叶按键()
    '==========以下是按键精灵录制的内容==========
    Delay 80
    KeyDown "2", 1
    Delay 67
    KeyUp "2", 1
    Delay 501
    KeyDown "Right", 1
    Delay 233
    KeyDown "Space", 1
    Delay 100
    KeyUp "Space", 1
    Delay 83
    KeyDown "Space", 1
    Delay 101
    KeyUp "Space", 1
    Delay 166
    KeyUp "Right", 1
    Delay 2
    KeyDown "2", 1
    Delay 65
    KeyUp "2", 1
    Delay 650
    KeyDown "Right", 1
    Delay 233
    KeyDown "Space", 1
    Delay 116
    KeyUp "Space", 1
    Delay 168
    KeyDown "Space", 1
    Delay 84
    KeyDown "2", 1
    Delay 15
    KeyUp "Space", 1
    Delay 101
    KeyUp "2", 1
    Delay 134
    KeyUp "Right", 1
    Delay 182
    KeyDown "Up", 1
    Delay 334
    KeyDown "Space", 1
    Delay 117
    KeyUp "Space", 1
    Delay 216
    KeyDown "Space", 1
    Delay 83
    KeyUp "Space", 1
    Delay 334
    KeyUp "Up", 1
    Delay 32
    KeyDown "`", 1
    Delay 83
    KeyUp "`", 1
    Delay 1500
    KeyDown "2", 1
    Delay 102
    KeyUp "2", 1
    Delay 781
    KeyDown "Left", 1
    Delay 502
    Delay 32
    KeyDown "Left", 1
    Delay 33
    Delay 34
    KeyDown "Left", 1
    Delay 33
    Delay 33
    KeyDown "Left", 1
    Delay 33
    Delay 16
    KeyDown "Space", 1
    Delay 101
    KeyUp "Space", 1
    Delay 250
    KeyDown "Space", 1
    Delay 82
    KeyUp "Space", 1
    Delay 218
    KeyUp "Left", 1
    Delay 300
    KeyDown "Left", 1
    Delay 133
    KeyDown "2", 1
    Delay 101
    KeyUp "2", 1
    Delay 1015
    KeyDown "2", 1
    Delay 85
    KeyUp "2", 1
    Delay 165
    KeyUp "Left", 1
    Delay 266
    KeyDown "Left", 1
    Delay 100
    KeyDown "Space", 1
    Delay 85
    KeyUp "Space", 1
    Delay 200
    KeyDown "Space", 1
    Delay 84
    KeyUp "Space", 1
    Delay 198
    KeyUp "Left", 1
    Delay 500
    KeyDown "Right", 1
    Delay 2000
    KeyUp "Right", 1
    Delay 1250
    KeyDown "C", 1
    Delay 73
    KeyUp "C", 1
    Delay 910
    KeyDown "Right", 1
    Delay 83
    KeyDown "Space", 1
    Delay 102
    KeyUp "Space", 1
    Delay 182
    KeyDown "Space", 1
    Delay 86
    KeyUp "Space", 1
    Delay 30
    KeyUp "Right", 1
    Delay 100
    Call 御剑追击()
    Delay 600
    KeyDown "2", 1
    Delay 95
    KeyUp "2", 1
    Delay 500
    '==========以上是按键精灵录制的内容==========
End Function

Function 开始刷枫叶图()
    currentTime = Now
    startTime = Hour(currentTime) * 60 + Minute(currentTime)
    Rem 开始清图
    KeyPress "=", 1
    Call 刷枫叶按键()
    currentTime = Now
    endTime = Hour(currentTime) * 60 + Minute(currentTime)
    Dim time
    time = endTime - startTime
    TracePrint "刷图时间:" & time & ": " & Now
    If time < 枫叶刷图时间 Then 
        Goto 开始清图
    Else 
        Delay 500
        KeyPress "Esc", 1
        Delay 1000
    End If
End Function

Function 进入铁板图()
    Delay 1000
    Call 打开菜单()
    Delay 682
    KeyDown "Down", 1
    Delay 118
    KeyUp "Down", 1
    Delay 127
    KeyDown "Down", 1
    Delay 139
    KeyUp "Down", 1
    Delay 600
    KeyDown "Enter", 1
    Delay 75
    KeyUp "Enter", 1
    Delay 660
    KeyDown "Down", 1
    Delay 100
    KeyUp "Down", 1
    Delay 283
    KeyDown "Down", 1
    Delay 135
    KeyUp "Down", 1
    Delay 132
    KeyDown "Down", 1
    Delay 149
    KeyUp "Down", 1
    Delay 168
    KeyDown "Down", 1
    Delay 165
    KeyUp "Down", 1
    Delay 203
    KeyDown "Down", 1
    Delay 133
    KeyUp "Down", 1
    Delay 216
    KeyDown "Down", 1
    Delay 133
    KeyUp "Down", 1
    Delay 283
    KeyDown "Down", 1
    Delay 117
    KeyUp "Down", 1
    Delay 235
    KeyDown "Down", 1
    Delay 116
    KeyUp "Down", 1
    Delay 267
    KeyDown "Down", 1
    Delay 100
    KeyUp "Down", 1
    Delay 284
    KeyDown "Down", 1
    Delay 100
    KeyUp "Down", 1
    Delay 267
    KeyDown "Down", 1
    Delay 100
    KeyUp "Down", 1
    Delay 250
    KeyDown "Down", 1
    Delay 100
    KeyUp "Down", 1
    Delay 299
    KeyDown "Enter", 1
    Delay 86
    KeyUp "Enter", 1
    Delay 583
    KeyDown "Down", 1
    Delay 116
    KeyUp "Down", 1
    Delay 267
    KeyDown "Down", 1
    Delay 115
    KeyUp "Down", 1
    Delay 318
    KeyDown "Down", 1
    Delay 119
    KeyUp "Down", 1
    Delay 300
    KeyDown "Down", 1
    Delay 149
    KeyUp "Down", 1
    Delay 667
    KeyDown "Enter", 1
    Delay 84
    KeyUp "Enter", 1
    Delay 2000
    //Call 输入密码()
End Function

Function 刷铁板按键()
    '==========以下是按键精灵录制的内容==========
    Delay 150
    KeyDown "Left", 1
    Delay 517
    KeyDown "2", 1
    Delay 98
    KeyUp "2", 1
    Delay 117
    KeyUp "Left", 1
    Delay 550
    KeyDown "Left", 1
    Delay 149
    KeyDown "Space", 1
    Delay 84
    KeyUp "Space", 1
    Delay 133
    KeyDown "Space", 1
    Delay 51
    KeyUp "Left", 1
    Delay 18
    KeyUp "Space", 1
    Delay 100
    Call 御剑追击()
    Delay 413
    KeyDown "Left", 1
    Delay 67
    KeyDown "2", 1
    Delay 93
    KeyUp "2", 1
    Delay 374
    KeyDown "Space", 1
    Delay 67
    KeyUp "Space", 1
    Delay 183
    KeyDown "Space", 1
    Delay 100
    KeyUp "Space", 1
    Delay 116
    KeyDown "Space", 1
    Delay 69
    KeyUp "Space", 1
    Delay 131
    KeyUp "Left", 1
    Delay 750
    KeyDown "`", 2
    Delay 115
    KeyUp "`", 2
    Delay 832
    KeyDown "Up", 1
    Delay 100
    KeyDown "Space", 1
    Delay 67
    KeyUp "Space", 1
    Delay 151
    KeyDown "Space", 1
    Delay 84
    KeyUp "Space", 1
    Delay 17
    KeyUp "Up", 1
    Delay 181
    KeyDown "Right", 1
    Delay 300
    KeyUp "Right", 1
    Delay 350
    KeyDown "2", 1
    Delay 85
    KeyUp "2", 1
    Delay 832
    KeyDown "Up", 1
    Delay 184
    KeyDown "Space", 1
    Delay 82
    KeyUp "Space", 1
    Delay 233
    KeyDown "Space", 1
    Delay 70
    KeyUp "Space", 1
    Delay 232
    KeyUp "Up", 1
    Delay 49
    KeyDown "2", 1
    Delay 68
    KeyUp "2", 1
    Delay 649
    KeyDown "Right", 1
    Delay 66
    KeyDown "Space", 1
    Delay 50
    KeyUp "Space", 1
    Delay 134
    KeyDown "Space", 1
    Delay 68
    KeyUp "Space", 1
    Delay 2
    KeyUp "Right", 1
    Delay 75
    KeyDown "2", 1
    Delay 75
    KeyUp "2", 1
    Delay 1050
    KeyDown "Right", 1
    Delay 17
    KeyDown "Space", 1
    Delay 167
    KeyUp "Space", 1
    Delay 67
    KeyDown "Space", 1
    Delay 69
    KeyUp "Space", 1
    Delay 32
    KeyUp "Right", 1
    Delay 133
    KeyDown "2", 1
    Delay 93
    KeyUp "2", 1
    Delay 556
    KeyDown "Right", 1
    Delay 517
    Delay 33
    KeyDown "Right", 1
    Delay 35
    Delay 32
    KeyDown "Right", 1
    Delay 16
    Delay 34
    KeyDown "Right", 1
    Delay 33
    Delay 33
    KeyDown "Right", 1
    Delay 51
    Delay 33
    KeyDown "Right", 1
    Delay 33
    Delay 33
    KeyDown "Right", 1
    Delay 2
    KeyUp "Right", 1
    Delay 150
    KeyDown "2", 1
    Delay 85
    KeyUp "2", 1
    Delay 500
    KeyDown "Down", 1
    Delay 100
    KeyDown "Space", 1
    Delay 85
    KeyUp "Space", 1
    Delay 32
    KeyUp "Down", 1
    Delay 901
    KeyDown "C", 1
    Delay 100
    KeyUp "C", 1
    Delay 699
    KeyDown "Left", 1
    Delay 17
    KeyDown "Space", 1
    Delay 134
    KeyUp "Space", 1
    Delay 165
    KeyDown "Space", 1
    Delay 50
    KeyUp "Space", 1
    Delay 20
    KeyDown "2", 1
    Delay 85
    KeyUp "2", 1
    Delay 84
    KeyUp "Left", 1
    Delay 416
    KeyDown "2", 1
    Delay 67
    KeyUp "2", 1
    Delay 800
    '==========以上是按键精灵录制的内容==========
End Function

Function 开始刷铁板()
    Delay 500
    currentTime = Now
    startTime = Hour(currentTime) * 60 + Minute(currentTime)
    Rem 开始刷怪
    KeyPress "=", 1
    Call 刷铁板按键()
    currentTime = Now
    endTime = Hour(currentTime) * 60 + Minute(currentTime)
    Dim time
    time = endTime - startTime
    TracePrint "刷图时间:" & time & ": " & Now
    If time < 铁板刷图时间 Then 
        Goto 开始刷怪
    Else 
        Delay 500
        KeyPress "Esc", 1
        Delay 1000
    End If
End Function

Function 开始进心火图()
    Delay 1000
    Call 打开菜单()
    Delay 200
    KeyDown "Down", 1
    Delay 102
    KeyUp "Down", 1
    Delay 100
    KeyDown "Down", 1
    Delay 117
    KeyUp "Down", 1
    Delay 649
    KeyDown "Enter", 1
    Delay 117
    KeyUp "Enter", 1
    Delay 501
    KeyDown "Down", 1
    Delay 84
    KeyUp "Down", 1
    Delay 117
    KeyDown "Down", 1
    Delay 83
    KeyUp "Down", 1
    Delay 133
    KeyDown "Down", 1
    Delay 67
    KeyUp "Down", 1
    Delay 117
    KeyDown "Down", 1
    Delay 100
    KeyUp "Down", 1
    Delay 200
    KeyDown "Down", 1
    Delay 84
    KeyUp "Down", 1
    Delay 182
    KeyDown "Down", 1
    Delay 84
    KeyUp "Down", 1
    Delay 217
    KeyDown "Down", 1
    Delay 84
    KeyUp "Down", 1
    Delay 167
    KeyDown "Down", 1
    Delay 99
    KeyUp "Down", 1
    Delay 218
    KeyDown "Down", 1
    Delay 100
    KeyUp "Down", 1
    Delay 150
    KeyDown "Down", 1
    Delay 100
    KeyUp "Down", 1
    Delay 218
    KeyDown "Down", 1
    Delay 82
    KeyUp "Down", 1
    Delay 262
    KeyDown "Down", 1
    Delay 72
    KeyUp "Down", 1
    Delay 583
    KeyDown "Enter", 1
    Delay 116
    KeyUp "Enter", 1
    Delay 435
    KeyDown "Down", 1
    Delay 83
    KeyUp "Down", 1
    Delay 284
    KeyDown "Down", 1
    Delay 100
    KeyUp "Down", 1
    Delay 250
    KeyDown "Down", 1
    Delay 102
    KeyUp "Down", 1
    Delay 315
    KeyDown "Down", 1
    Delay 84
    KeyUp "Down", 1
    Delay 533
    KeyDown "Down", 1
    Delay 117
    KeyUp "Down", 1
    Delay 400
    KeyDown "Down", 1
    Delay 118
    KeyUp "Down", 1
    Delay 649
    KeyDown "Enter", 1
    Delay 117
    KeyUp "Enter", 1
    Delay 1000
    //Call 输入密码()
End Function

Function 心火房按键()
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
    Call 御剑追击()
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
    KeyDown "Down", 1
    Delay 286
    KeyDown "Space", 1
    Delay 83
    KeyUp "Down", 1
    Delay 36
    KeyUp "Space", 1
    Delay 1367
End Function

Function 心火房按键前置()
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

Function 开始刷心火()
    currentTime = Now
    startTime = Hour(currentTime) * 60 + Minute(currentTime)
    Call 心火房按键前置()
    Rem 开始清图
    Delay 1000
    KeyDown "=", 1
    Delay 50
    KeyUp "=", 1
    Delay 1000
    Call 心火房按键()
    currentTime = Now
    endTime = Hour(currentTime) * 60 + Minute(currentTime)
    Dim time
    time = endTime - startTime
    TracePrint "刷图时间:" & time & ": " & Now
    If time < 心火刷图时间 Then 
        Goto 开始清图
    Else 
        Delay 500
        KeyPress "Esc", 1
        Delay 1000
    End If
End Function

Function 开始寻宝()
    '==========以下是按键精灵录制的内容==========
    '接任务
    Delay 200
    KeyDown "I", 1
    Delay 95
    KeyUp "I", 1
    Delay 1000
    KeyDown "Down", 1
    Delay 115
    KeyUp "Down", 1
    Delay 500
    KeyDown "Enter", 1
    Delay 94
    KeyUp "Enter", 1
    Delay 500
    KeyDown "Enter", 1
    Delay 100
    KeyUp "Enter", 1
    '买罗盘
    Delay 500
    KeyDown "I", 1
    Delay 115
    KeyUp "I", 1
    Delay 1500
    KeyDown "Down", 1
    Delay 141
    KeyUp "Down", 1
    Delay 199
    KeyDown "Down", 1
    Delay 129
    KeyUp "Down", 1
    Delay 164
    KeyDown "Down", 1
    Delay 117
    KeyUp "Down", 1
    Delay 257
    KeyDown "Down", 1
    Delay 93
    KeyUp "Down", 1
    Delay 382
    KeyDown "Enter", 1
    Delay 76
    KeyUp "Enter", 1
    Delay 1270
    KeyDown "Right", 1
    Delay 123
    KeyUp "Right", 1
    Delay 940
    KeyDown "Enter", 1
    Delay 103
    KeyUp "Enter", 1
    Delay 821
    KeyDown "Enter", 1
    Delay 102
    KeyUp "Enter", 1
    '传送到地点
    Delay 800
    KeyDown "H", 1
    Delay 2000
    KeyUp "H", 1
    Delay 443
    KeyDown "Enter", 1
    Delay 103
    KeyUp "Enter", 1
    '交任务
    Delay 1200
    KeyDown "I", 1
    Delay 92
    KeyUp "I", 1
    Delay 1200
    KeyDown "Down", 1
    Delay 147
    KeyUp "Down", 1
    Delay 367
    KeyDown "Enter", 1
    Delay 81
    KeyUp "Enter", 1
    Delay 1318
    KeyDown "Enter", 1
    Delay 82
    KeyUp "Enter", 1
    Delay 1000
    '==========以上是按键精灵录制的内容==========
	
    当前寻宝次数 = 当前寻宝次数 + 1
End Function

Function 开始跑环()
    Call 打开菜单()
    KeyDown "Down", 1
    Delay 149
    KeyUp "Down", 1
    Delay 368
    KeyDown "Down", 1
    Delay 118
    KeyUp "Down", 1
    Delay 566
    KeyDown "Enter", 1
    Delay 94
    KeyUp "Enter", 1
    Delay 723
    KeyDown "Down", 1
    Delay 134
    KeyUp "Down", 1
    Delay 234
    KeyDown "Down", 1
    Delay 115
    KeyUp "Down", 1
    Delay 733
    KeyDown "Enter", 1
    Delay 18
    KeyUp "Enter", 1
    Delay 885
    KeyDown "Down", 1
    Delay 99
    KeyUp "Down", 1
    Delay 635
    KeyDown "Enter", 1
    Delay 83
    KeyUp "Enter", 1
    Delay 1719
    KeyDown "Down", 1
    Delay 100
    KeyUp "Down", 1
    Delay 383
    KeyDown "Enter", 1
    Delay 67
    KeyUp "Enter", 1
    Delay 1268
    KeyDown "Enter", 1
    Delay 216
    KeyUp "Enter", 1
    Delay 984
    KeyDown "Enter", 1
    Delay 101
    KeyUp "Enter", 1
    Delay 500
    当前跑环次数 = 当前跑环次数 + 1
End Function


Function 回到自由
    Call 打开菜单()
    Delay 1500
    KeyPress "Enter", 1
End Function

Function 回到射手
    Call 打开菜单()
    Delay 1200
    KeyPress "Down", 1
    Delay 800
    KeyPress "Enter", 1
    Delay 800
    KeyPress "Enter", 1
    Delay 1200
    KeyPress "Down", 1
    Delay 800
    KeyPress "Enter", 1
    Delay 1200
    KeyPress "Left", 1
    Delay 1200
    KeyPress "Left", 1
    Delay 800
    KeyPress "Enter", 1
    Delay 3000
	
End Function

Function 打开菜单()
    Delay 1000
    KeyPress "F1", 1
    Delay 1000
End Function

Function 进入升级地图()
    Delay 961
    KeyDown "F1", 1
    Delay 167
    KeyUp "F1", 1
    Delay 400
    KeyDown "Down", 1
    Delay 133
    KeyUp "Down", 1
    Delay 451
    KeyDown "Down", 1
    Delay 134
    KeyUp "Down", 1
    Delay 432
    KeyDown "Enter", 1
    Delay 133
    KeyUp "Enter", 1
    Delay 452
    KeyDown "Down", 1
    Delay 150
    KeyUp "Down", 1
    Delay 450
    KeyDown "Down", 1
    Delay 134
    KeyUp "Down", 1
    Delay 383
    KeyDown "Down", 1
    Delay 167
    KeyUp "Down", 1
    Delay 401
    KeyDown "Down", 1
    Delay 150
    KeyUp "Down", 1
    Delay 417
    KeyDown "Down", 1
    Delay 133
    KeyUp "Down", 1
    Delay 467
    KeyDown "Down", 1
    Delay 150
    KeyUp "Down", 1
    Delay 417
    KeyDown "Down", 1
    Delay 153
    KeyUp "Down", 1
    Delay 398
    KeyDown "Down", 1
    Delay 152
    KeyUp "Down", 1
    Delay 415
    KeyDown "Down", 1
    Delay 150
    KeyUp "Down", 1
    Delay 450
    KeyDown "Down", 1
    Delay 133
    KeyUp "Down", 1
    Delay 433
    KeyDown "Down", 1
    Delay 151
    KeyUp "Down", 1
    Delay 401
    KeyDown "Down", 1
    Delay 150
    KeyUp "Down", 1
    Delay 466
    KeyDown "Down", 1
    Delay 135
    KeyUp "Down", 1
    Delay 482
	
    KeyDown "Enter", 1
    Delay 167
    KeyUp "Enter", 1
	
    Delay 536
    KeyDown "Down", 1
    Delay 132
    KeyUp "Down", 1
    Delay 536
    KeyDown "Down", 1
    Delay 132
    KeyUp "Down", 1
    Delay 536
    KeyDown "Down", 1
    Delay 132
    KeyUp "Down", 1
    Delay 536
    KeyDown "Down", 1
    Delay 132
    KeyUp "Down", 1
    Delay 536
    KeyDown "Down", 1
    Delay 132
    KeyUp "Down", 1
    Delay 536
    KeyDown "Down", 1
    Delay 132
    KeyUp "Down", 1
	
    Delay 500
    KeyDown "Enter", 1
    Delay 183
    KeyUp "Enter", 1
    Call 输入密码()
End Function

Function 练功房小道前置()
    KeyDown "Left", 1
    Delay 2000
    KeyUp "Left", 1
End Function

Function 练功房小道1()
    Delay 300
    KeyDown "`", 1
    Delay 82
    KeyUp "`", 1
    Delay 1751
    KeyDown "F4", 1
    Delay 66
    KeyUp "F4", 1
    Delay 500
    KeyDown "2", 1
    Delay 73
    KeyUp "2", 1
    Delay 100
    Call 御剑追击()
    Delay 650
    KeyDown "Right", 1
    Delay 2
    KeyDown "Space", 1
    Delay 115
    KeyUp "Space", 1
    Delay 150
    KeyDown "Space", 1
    Delay 118
    KeyUp "Space", 1
    Delay 99
    KeyUp "Right", 1
    Delay 601
    KeyDown "2", 1
    Delay 94
    KeyUp "2", 1
    Delay 755
    KeyDown "Right", 1
    Delay 51
    KeyDown "Space", 1
    Delay 99
    KeyUp "Space", 1
    Delay 101
    KeyDown "Space", 1
    Delay 100
    KeyUp "Right", 1
    Delay 1
    KeyUp "Space", 1
    Delay 1098
    KeyDown "Right", 1
    Delay 501
    Delay 32
    KeyDown "Right", 1
    Delay 50
    Delay 33
    KeyDown "Right", 1
    Delay 34
    Delay 33
    KeyDown "Right", 1
    Delay 33
    Delay 35
    KeyDown "Right", 1
    Delay 32
    Delay 17
    KeyDown "Right", 1
    Delay 34
    Delay 17
    KeyUp "Right", 1
    Delay 700
    KeyDown "Down", 1
    Delay 67
    KeyDown "Space", 1
    Delay 150
    KeyUp "Space", 1
    Delay 34
    KeyUp "Down", 1
    Delay 700
    KeyDown "2", 1
    Delay 85
    KeyUp "2", 1
    Delay 664
    KeyDown "Left", 1
    Delay 83
    KeyDown "Space", 1
    Delay 103
    KeyUp "Space", 1
    Delay 131
    KeyDown "Space", 1
    Delay 100
    KeyUp "Space", 1
    Delay 151
    KeyUp "Left", 1
    Delay 199
    KeyDown "2", 1
    Delay 101
    KeyUp "2", 1
    Delay 949
    KeyDown "Space", 1
    Delay 84
    KeyDown "Left", 1
    Delay 83
    KeyUp "Space", 1
    Delay 133
    KeyDown "Space", 1
    Delay 117
    KeyUp "Space", 1
    Delay 200
    KeyUp "Left", 1
    Delay 566
    KeyDown "Left", 1
    Delay 101
    KeyDown "Space", 1
    Delay 132
    KeyUp "Space", 1
    Delay 150
    KeyDown "Space", 1
    Delay 102
    KeyUp "Space", 1
    Delay 49
    KeyUp "Left", 1
    Delay 133
    KeyDown "2", 1
    Delay 68
    KeyUp "2", 1
    Delay 715
    KeyDown "Left", 1
    Delay 18
    KeyDown "Space", 1
    Delay 132
    KeyUp "Space", 1
    Delay 100
    KeyDown "Space", 1
    Delay 119
    KeyUp "Space", 1
    Delay 31
    KeyUp "Left", 1
    Delay 1083
End Function

Function 海岸草丛1前置()
    Delay 500
    KeyDown "Left", 1
    Delay 69
    KeyDown "Space", 1
    Delay 100
    KeyUp "Space", 1
    Delay 148
    KeyDown "Space", 1
    Delay 107
    KeyUp "Space", 1
    Delay 350
    KeyUp "Left", 1	
End Function

Function 海岸草丛1()
    '==========以下是按键精灵录制的内容==========
    Delay 200
    KeyDown "Right", 1
    Delay 100
    KeyDown "Space", 1
    Delay 68
    KeyUp "Space", 1
    Delay 100
    KeyDown "Space", 1
    Delay 109
    KeyUp "Space", 1
    Delay 178
    KeyDown "2", 1
    Delay 17
    KeyUp "Right", 1
    Delay 64
    KeyUp "2", 1
    Delay 600
    KeyDown "Right", 1
    Delay 83
    KeyDown "Space", 1
    Delay 67
    KeyUp "Space", 1
    Delay 117
    KeyDown "Space", 1
    Delay 103
    KeyUp "Space", 1
    Delay 123
    KeyUp "Right", 1
    Delay 182
    KeyDown "2", 1
    Delay 86
    KeyUp "2", 1
    Delay 609
    KeyDown "C", 1
    Delay 92
    KeyUp "C", 1
    Delay 458
    KeyDown "Right", 1
    Delay 94
    KeyDown "Space", 1
    Delay 74
    KeyUp "Space", 1
    Delay 115
    KeyDown "Space", 1
    Delay 91
    KeyUp "Space", 1
    Delay 77
    KeyUp "Right", 1
    Delay 332
    KeyDown "2", 1
    Delay 85
    KeyUp "2", 1
    Call 御剑追击()
    Delay 200
    KeyDown "Right", 1
    Delay 89
    KeyDown "Space", 1
    Delay 97
    KeyUp "Space", 1
    Delay 116
    KeyDown "Space", 1
    Delay 103
    KeyUp "Space", 1
    Delay 505
    KeyUp "Right", 1
    Delay 283
    KeyDown "Right", 1
    Delay 79
    KeyDown "Space", 1
    Delay 124
    KeyUp "Space", 1
    Delay 141
    KeyDown "Space", 1
    Delay 98
    KeyUp "Space", 1
    Delay 12
    KeyUp "Right", 1
    Delay 474
    KeyDown "2", 1
    Delay 93
    KeyUp "2", 1
    Delay 714
    KeyDown "Left", 1
    Delay 63
    KeyDown "Space", 1
    Delay 120
    KeyUp "Space", 1
    Delay 129
    KeyDown "Space", 1
    Delay 123
    KeyUp "Space", 1
    Delay 31
    KeyUp "Left", 1
    Delay 362
    KeyDown "2", 1
    Delay 92
    KeyUp "2", 1
    Delay 422
    KeyDown "Left", 1
    Delay 105
    KeyDown "Space", 1
    Delay 110
    KeyUp "Space", 1
    Delay 178
    KeyDown "Space", 1
    Delay 128
    KeyUp "Space", 1
    Delay 159
    KeyDown "Space", 1
    Delay 118
    KeyUp "Space", 1
    Delay 76
    KeyUp "Left", 1
    Delay 214
    KeyDown "2", 1
    Delay 85
    KeyUp "2", 1
    Delay 811
    KeyDown "Down", 1
    Delay 88
    KeyDown "Space", 1
    Delay 125
    KeyUp "Space", 1
    Delay 159
    KeyUp "Down", 1
    Delay 216
    KeyDown "Left", 1
    Delay 143
    KeyDown "2", 1
    Delay 76
    KeyUp "2", 1
    Delay 286
    KeyDown "Space", 1
    Delay 125
    KeyUp "Space", 1
    Delay 177
    KeyDown "Space", 1
    Delay 96
    KeyUp "Space", 1
    Delay 114
    KeyDown "Space", 1
    Delay 92
    KeyUp "Space", 1
    Delay 92
    KeyDown "Space", 1
    Delay 75
    KeyUp "Space", 1
    Delay 229
    KeyUp "Left", 1
    Delay 35
    KeyDown "2", 1
    Delay 67
    KeyUp "2", 1
    Delay 498
    KeyDown "Left", 1
    Delay 103
    KeyDown "Space", 1
    Delay 80
    KeyUp "Space", 1
    Delay 129
    KeyDown "Space", 1
    Delay 84
    KeyUp "Space", 1
    Delay 137
    KeyDown "Space", 1
    Delay 99
    KeyUp "Space", 1
    Delay 104
    KeyUp "Left", 1
    Delay 130
    KeyDown "2", 1
    Delay 67
    KeyUp "2", 1
    Delay 549
    KeyDown "Left", 1
    Delay 79
    KeyDown "Space", 1
    Delay 109
    KeyUp "Space", 1
    Delay 119
    KeyDown "Space", 1
    Delay 82
    KeyUp "Space", 1
    Delay 77
    KeyUp "Left", 1
    Delay 71
    KeyDown "2", 1
    Delay 64
    KeyUp "2", 1
    '==========以上是按键精灵录制的内容==========
End Function

Function 开始升级()
    Delay 100
    KeyDown "=", 1
    Delay 100
    KeyUp "=", 1
    Delay 100
    Call 海岸草丛1前置()
    Delay 200
    当前升级次数 = 当前升级次数 + 1
    currentTime = Now
    startTime = Hour(currentTime) * 60 + Minute(currentTime)
    Delay 200
    Rem 开始清图
    Call 海岸草丛1()
    Delay 200
    currentTime = Now
    endTime = Hour(currentTime) * 60 + Minute(currentTime)
    Dim time
    time = endTime - startTime
    TracePrint "升级地图时间:" & time & ": " & Now
    If time < 升级刷图时间 Then 
        Goto 开始清图
    Else 
        Delay 500
        KeyPress "Esc", 1
        Delay 1000
    End If
End Function

Function 开始换线()
    Delay 1000
    KeyPress "ESC", 1
    Delay 1000
    KeyPress "ESC", 1
    Delay 1000
    KeyPress "Enter", 1
    Delay 1000
    KeyPress "Right", 1
    Delay 1000
    KeyPress "Enter", 1
    Delay 8000
End Function
// mxd Hwnd
Function getMxdHwnd()
    getMxdHwnd = Plugin.Window.Find("MapleStoryClass", "MapleStory")
End Function

TracePrint "前置延时" & Now()
Delay 前置延时
TracePrint "前置延时结束" & Now()

Call Plugin.Window.Top(getMxdHwnd, 0)
Call Plugin.Window.Active(getMxdHwnd)

Call 回到射手()

Rem 铁板刷图脚本
TracePrint "铁板进图次数:" & 当前铁板次数 & ": " & Now
铁板进图次数 = 判断进图次数(当前铁板次数, 铁板刷图次数)
If 铁板进图次数 = YES Then 
    Call 进入铁板图()
    铁板房是否有人 = 判断房间有人()
    TracePrint "铁板房是否有人" & 铁板房是否有人
    If 铁板房是否有人 = YES Then 
        Call 开始换线()
        goto 铁板刷图脚本
    End If
    当前铁板次数 = 当前铁板次数 + 1
    Call 开始刷铁板()
    Goto 铁板刷图脚本
End If


Rem 枫叶刷图脚本
TracePrint "枫叶进图次数:" & 当前枫叶次数 & ": " & Now
枫叶刷图结果 = 判断进图次数(当前枫叶次数, 枫叶刷图次数)
If 枫叶刷图结果 = YES Then 
    Call 进入枫叶图()
    枫叶房是否有人 = 判断房间有人()
    TracePrint "枫叶房是否有人" & 枫叶房是否有人
    If 枫叶房是否有人 = YES Then 
        Call 开始换线()
        goto 枫叶刷图脚本
    End If
    当前枫叶次数 = 当前枫叶次数 + 1
    Call 开始刷枫叶图()
    Goto 枫叶刷图脚本
End If

Rem 心火刷图脚本
TracePrint "心火进图次数:" & 当前心火次数 & ": " & Now
心火刷图结果 = 判断进图次数(当前心火次数, 心火刷图次数)
If 心火刷图结果 = YES Then 
    Call 开始进心火图()
    心火房是否有人 = 判断房间有人()
    TracePrint "心火房是否有人：" & 心火房是否有人
	
    If 心火房是否有人 = YES Then 
        Call 开始换线()
        goto 心火刷图脚本
    End If
    当前心火次数 = 当前心火次数 + 1
    Call 开始刷心火()
    Goto 心火刷图脚本
End If




Rem 升级刷图脚本
升级刷图结果 = 判断进图次数(当前升级次数, 升级刷图次数)
If 升级刷图结果 = YES Then 
    Call 回到射手()
    Call 进入升级地图()
    Call 开始升级()
    Goto 升级刷图脚本
End If


Rem 每日寻宝脚本
If 当前寻宝次数 < 寻宝次数 Then 
    Call 开始寻宝()
    Goto 每日寻宝脚本
End If

Rem 每日跑环脚本
If 当前跑环次数 < 跑环次数 Then 
    Call 开始跑环()
    Goto 每日跑环脚本
End If

TracePrint 当前枫叶次数 & ", " & 当前铁板次数 & ", " & 当前心火次数 & ", " & 当前寻宝次数

Call 回到自由()

Call Plugin.Window.Top(getMxdHwnd, 1)
