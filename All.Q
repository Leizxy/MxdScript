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
loginPath = "D:\mxd\ð�յ�online\���ð�յ�[��].exe"
checkMinute = 210	//���ʱ��-��

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
// 
������� = Array(680, 25)

// =======  lib ==========
'###����ʶ������
p1 = Array(0,0)
p2 = Array(2560, 1440)
people1 = Array(0, 0)
people2 = Array(2560, 1440)
�����Ѿ�����= "people"

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
			messagebox "����汾����,��ǰʹ�õİ汾��:"&ver&",�������Ŀ¼��:"&dm.GetBasePath()
			messagebox "��رճ���,���´򿪱������ٳ���"
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

Function �����Ƿ�����()
	Set dm = createobject("dm.dmsoft")
	base_path = dm.GetBasePath()
	dm_ret = dm.SetPath(base_path)
	dm_ret = dm.SetDict(0,"people.txt")
	s = dm.Ocr(people1(0), people1(1), people2(0), people2(1), "ffffff-000000|ffffff-000000", 1.0)
	
	If �����Ѿ����� = s Then 
		�����Ƿ����� = True
	Else 
		�����Ƿ����� = False
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

// =======    �ص�    =============
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
	Call leftClickSingle(convertWindowPos(getLoginHwnd, ������Ϸ), 60000, "������Ϸ")
	Call leftClickSingle(convertWindowPos(getMxdHwnd, ����), 5000, "����")
	Call leftClickSingle(convertWindowPos(getLoginHwnd, ȡ��), 1000, "ȡ��")
	Call leftClickSingle(convertWindowPos(getLoginHwnd, ��¼�˺�), 20000, "��¼�˺�")
	Call leftClickSingle(convertWindowPos(getMxdHwnd, ������), 1500, "������")
	Call leftClickPos(convertWindowPos(getMxdHwnd, Channel01), 2, 1500, "Channel01")
	Call leftClickSingle(convertWindowPos(getMxdHwnd, ��ʼ��Ϸ), 1500, "��ʼ��Ϸ")
	Call log("openMxd", "finish")
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
// =======    �ص�    =============

// =======    ����    =============
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
// =======    ����    =============

// =======    �˵�    =============
// todo ��������
// ����
���� = Array("Esc", 1, "Enter", 1, "Right", 1, "Enter", 1)
// ����ȯ
�˵� = Array("F1", 1)
// ȷ�ϰ�ť
ȷ�ϼ� = Array("Right", 1, "Enter", 1)
// Enter
Enter = Array("Enter", 1)
// ����
���� = Array("Down", 1, "Enter", 2, "Down", 1, "Enter", 1)
// ÿ�ո���
ÿ�ո��� = Array("Down", 2, "Enter", 1)
// ���߽���
���߽��� = Array("Down", 5, "Enter", 1)
// ֤����ȡ
֤����ȡ = Array("Down", 15, "Enter", 1)
// ���Ϸ�
���Ϸ� = Array("Down", 12, "Enter", 1)
// ���巿
���巿 = Array("Down", 4, "Enter", 1)
// �Ļ�
�Ļ� = Array("Down", 6, "Enter", 1)
// ��ë��
��ë�� = Array("Down", 7, "Enter", 1)

// ����
Function clearGameWindow()
	Call press("Esc", 500)
	Call leftClickSingle(convertWindowPos(getLoginHwnd, �������), 1500, "�������")
End Function

Function ������(endDelay)
	Call pressKeyList(�˵�, 2000)
	Call pressKeyListSimple(Enter)
	Delay endDelay
End Function

Function ȷ��(endDelay)
	Delay 800
	Call pressKeyListSimple(ȷ�ϼ�)
	Delay endDelay
End Function

Function ȥ����(endDelay)
	Call pressKeyList(�˵�, 2000)
	Call pressKeyListSimple(����)
	Call ȷ��(endDelay)
End Function

Function ��ÿ�ո���()
	Call pressKeyList(�˵�, 2000)
	Call pressKeyListSimple(ÿ�ո���)	
End Function

Function �򿪲��Ϸ�()
	Call ��ÿ�ո���()
	Call pressKeyListSimple(���Ϸ�)
End Function

Function ȥ��Ҷ��(endDelay)
	Call �򿪲��Ϸ�()
	Call pressKeyListSimple(Enter)
	Call inputPassword()
	Delay endDelay
End Function

Function ȥ���巿(endDelay)
	Call �򿪲��Ϸ�()
	Call pressKeyListSimple(���巿)
	Call inputPassword()
	Delay endDelay
End Function

Function ȥ�Ļ�(endDelay)
	Call �򿪲��Ϸ�()
	Call pressKeyListSimple(�Ļ�)
	Call inputPassword()
	Delay endDelay
End Function

Function ȥ��ë��(endDelay)
	Call �򿪲��Ϸ�()
	Call pressKeyListSimple(��ë��)
	Call inputPassword()
	Delay endDelay
End Function

Function ��ȡ֤��(endDelay)
	Call ��ÿ�ո���()
	Call pressKeyListSimple(֤����ȡ)
	Call ȷ��(endDelay)
End Function

Function ��ȡ���߽���(endDelay)
	Call ��ÿ�ո���()
	Call pressKeyListSimple(���߽���)
	// todo 
End Function

Function ��ʼ����()
	Call log("��ʼ����", " ")
	Call clearGameWindow()
	Call pressKeyListSimple(����)
	Delay 8000
End Function
// =======    �˵�    =============


// =======    ˢͼ    =============
ˢ��Ҷ���� = 6
��ǰ��Ҷ���� = 0

Function ��ʼˢ��Ҷ()
	
End Function

// todo add checkmxd
Function ˢ��Ҷ()	
	While ��ǰˢ��Ҷ���� < ˢ��Ҷ����
    	Call ȥ��Ҷ��(1500)
			
		If �����Ƿ�����() = True Then 
			Call ��ʼ����()
		End If
		
		��ǰ��Ҷ���� = ��ǰ��Ҷ���� + 1
		Call ��ʼˢ��Ҷ()
		TracePrint "��ǰ��Ҷ����: " & ��ǰ��Ҷ����
		Call log("ˢ��Ҷ", "��ǰ��Ҷ����: " & ��ǰ��Ҷ����)
	Wend
End Function
// =======    ˢͼ    =============

// main
Function main()
	//Call check(30)
	Call Plugin.Window.Active(getMxdHwnd)
	//todo clear
	Call clearGameWindow()
	// todo
	//Call ������(1500)
	//Call ȥ����(1500)
	//Call ��ȡ֤��(1500)
	//Call ȥ��Ҷ��(1500)
	//Call ȥ���巿(1500)
	//Call ȥ�Ļ�(1500)
End Function

Call ˢ��Ҷ()