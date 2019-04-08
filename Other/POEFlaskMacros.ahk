#SingleInstance force ; Reset this instance ever restart
#Persistent

global Flask1Group = true
global Flask1Quick = false
global Flask1Key = 1
global Flask1Duration = 8000

global Flask2Group = true
global Flask2Quick = false
global Flask2Key = 2
global Flask2Duration = 8000

global Flask3Group = false
global Flask3Quick = true
global Flask3Key = 3
global Flask3Duration = 4700

global Flask4Group = false
global Flask4Quick = true
global Flask4Key = 4
global Flask4Duration = 4000

global Flask5Group = true
global Flask5Quick = false
global Flask5Key = 5
global Flask5Duration = 4700

global GroupPrefix
global GroupSuffix := "space"
global QuickPrefix
global QuickSuffix := "\"

Load()


global FlaskEnable := false

global counter := new FlaskCounter

RegisterHotkeys()


Gui, Add, Text, ym w50, Flasks
Gui, Add, Text, ym w50, Group
Gui, Add, Text, ym w50, Quicksilver
Gui, Add, Text, ym w100, Key
Gui, Add, Text, ym w100, Duration (ms)
Gui, Add, Text, xm, Flask 1:
Gui, Add, Checkbox, yp x70 vFlask1Group Checked%Flask1Group%
Gui, Add, Checkbox, yp x130 vFlask1Quick Checked%Flask1Quick%
Gui Add, Edit, yp x190+m w95 vFlask1Key, %Flask1Key%
Gui Add, Edit, yp x290 w95 vFlask1Duration, %Flask1Duration%
Gui, Add, Text, xm, Flask 2:
Gui, Add, Checkbox, yp x70 vFlask2Group Checked%Flask2Group%
Gui, Add, Checkbox, yp x130 vFlask2Quick Checked%Flask2Quick%
Gui Add, Edit, yp x190+m w95 vFlask2Key, %Flask2Key%
Gui Add, Edit, yp x290 w95 vFlask2Duration, %Flask2Duration%
Gui, Add, Text, xm, Flask 3:
Gui, Add, Checkbox, yp x70 vFlask3Group Checked%Flask3Group%
Gui, Add, Checkbox, yp x130 vFlask3Quick Checked%Flask3Quick%
Gui Add, Edit, yp x190+m w95 vFlask3Key, %Flask3Key%
Gui Add, Edit, yp x290 w95 vFlask3Duration, %Flask3Duration%
Gui, Add, Text, xm, Flask 4:
Gui, Add, Checkbox, yp x70 vFlask4Group Checked%Flask4Group%
Gui, Add, Checkbox, yp x130 vFlask4Quick Checked%Flask4Quick%
Gui Add, Edit, yp x190+m w95 vFlask4Key, %Flask4Key%
Gui Add, Edit, yp x290 w95 vFlask4Duration, %Flask4Duration%
Gui, Add, Text, xm, Flask 5:
Gui, Add, Checkbox, yp x70 vFlask5Group Checked%Flask5Group%
Gui, Add, Checkbox, yp x130 vFlask5Quick Checked%Flask5Quick%
Gui Add, Edit, yp x190+m w95 vFlask5Key, %Flask5Key%
Gui Add, Edit, yp x290 w95 vFlask5Duration, %Flask5Duration%
; This GUI allows you to register primitive three-key combination hotkeys:
Gui Add, Text, xm, Group Hotkey:
Gui Add, Edit, yp x100 w100 vGroupPrefix, %GroupPrefix%
Gui Add, Edit, yp x200 w100 vGroupSuffix, %GroupSuffix%
Gui Add, Text, xm, Quicksilver hotkey:
Gui Add, Edit, yp x100 w100 vQuickPrefix, %QuickPrefix%
Gui Add, Edit, yp x200 w100 vQuickSuffix, %QuickSuffix%
Gui Add, Button, Default, Register


#IfWinActive ahk_class POEWindowClass
F11::
	Gui Show
return

ButtonRegister() {
    global
    Gui Submit
	Save()
	RegisterHotkeys()
}

RegisterHotkeys(){
	global
    local fn
	if(GroupSuffix){
    fn := Func("HotkeyShouldFire").Bind(GroupPrefix)
    Hotkey If, % fn
    Hotkey % GroupSuffix, FireGroupHotkey
	}
    local fn2
	if(QuickSuffix){
    fn2 := Func("HotkeyShouldFire").Bind(QuickPrefix)
    Hotkey If, % fn2
    Hotkey % QuickSuffix, FireQuickHotkey
	}
}

HotkeyShouldFire(prefix, thisHotkey) {
	if(WinActive("ahk_class POEWindowClass"))
	{
	if(prefix){
    return GetKeyState(prefix)
	} else {
	return true
	}
	}
	return false
}
 
FireGroupHotkey() {
	if(Flask1Group){
		Send %Flask1Key%
		Sleep 25
	}
	if(Flask2Group){
		Send %Flask2Key%
		Sleep 25
	}
	if(Flask3Group){
		Send %Flask3Key%
		Sleep 25
	}
	if(Flask4Group){
		Send %Flask4Key%
		Sleep 25
	}
	if(Flask5Group){
		Send %Flask5Key%
		Sleep 25
	}
}

FireQuickHotkey() {
	if(FlaskEnable){
		FlaskEnable := false
		counter.Stop()
		;SoundBeep
	}else{
		FlaskEnable := true
		counter.Start()
		;SoundBeep
		;SoundBeep
	}
}


class FlaskCounter {
    __New() {
        this.interval := 100
        this.count := 0
		this.currentFlaskDuration := 0
		this.currentFlask := 0
		this.currentFlaskIndex := 1
		this.flaskArray := []
        ; Tick() has an implicit parameter "this" which is a reference to
        ; the object, so we need to create a function which encapsulates
        ; "this" and the method to call:
        this.timer := ObjBindMethod(this, "Tick")
    }
    Start() {
        ; Known limitation: SetTimer requires a plain variable reference.
		this.flaskArray := []
		if(Flask1Quick)
		{
		this.flaskArray.Push(1)
		}
		if(Flask2Quick)
		{
		this.flaskArray.Push(2)
		}
		if(Flask3Quick)
		{
		this.flaskArray.Push(3)
		}
		if(Flask4Quick)
		{
		this.flaskArray.Push(4)
		}
		if(Flask5Quick)
		{
		this.flaskArray.Push(5)
		}
		if(this.flaskArray.Length() > 0) this.currentFlask := this.flaskArray[1]
		this.NextFlask()
		
        timer := this.timer
        SetTimer % timer, % this.interval
        ;ToolTip % "Counter started"
    }
    Stop() {
        ; To turn off the timer, we must pass the same object as before:
        timer := this.timer
        SetTimer % timer, Off
        ;ToolTip % "Counter stopped at " this.count
    }
    ; In this example, the timer calls this method:
    Tick() {
		++this.count
        ;ToolTip % this.count
		if(this.currentFlask){
			if(this.count >= this.currentFlaskDuration/this.interval)
			{
				this.NextFlask()
			}
		}
    }
	NextFlask(){
		this.count := 0
		
		
		if(this.currentFlask){
			myFlask := this.currentFlask
			thisFlask := Flask%myFlask%Quick
			
			if(thisFlask and WinActive("ahk_class POEWindowClass")){
				;SoundBeep
				Send % Flask%myFlask%Key
				this.currentFlaskDuration := Flask%myFlask%Duration
				
			}
		}
		if(this.flaskArray.Length() > 0){
			++this.currentFlaskIndex
			if(this.currentFlaskIndex > this.flaskArray.Length()){
				this.currentFlaskIndex := 1
			}
			this.currentFlask := this.flaskArray[this.currentFlaskIndex]
		}

	}
}

Save(){
IniWrite, %Flask1Group%, %A_ScriptDir%\flaskconfig.ini, Main, Flask1Group
IniWrite, %Flask1Quick%, %A_ScriptDir%\flaskconfig.ini, Main, Flask1Quick
IniWrite, %Flask1Key%, %A_ScriptDir%\flaskconfig.ini, Main, Flask1Key
IniWrite, %Flask1Duration%, %A_ScriptDir%\flaskconfig.ini, Main, Flask1Duration

IniWrite, %Flask2Group%, %A_ScriptDir%\flaskconfig.ini, Main, Flask2Group
IniWrite, %Flask2Quick%, %A_ScriptDir%\flaskconfig.ini, Main, Flask2Quick
IniWrite, %Flask2Key%, %A_ScriptDir%\flaskconfig.ini, Main, Flask2Key
IniWrite, %Flask2Duration%, %A_ScriptDir%\flaskconfig.ini, Main, Flask2Duration

IniWrite, %Flask3Group%, %A_ScriptDir%\flaskconfig.ini, Main, Flask3Group
IniWrite, %Flask3Quick%, %A_ScriptDir%\flaskconfig.ini, Main, Flask3Quick
IniWrite, %Flask3Key%, %A_ScriptDir%\flaskconfig.ini, Main, Flask3Key
IniWrite, %Flask3Duration%, %A_ScriptDir%\flaskconfig.ini, Main, Flask3Duration

IniWrite, %Flask4Group%, %A_ScriptDir%\flaskconfig.ini, Main, Flask4Group
IniWrite, %Flask4Quick%, %A_ScriptDir%\flaskconfig.ini, Main, Flask4Quick
IniWrite, %Flask4Key%, %A_ScriptDir%\flaskconfig.ini, Main, Flask4Key
IniWrite, %Flask4Duration%, %A_ScriptDir%\flaskconfig.ini, Main, Flask4Duration

IniWrite, %Flask5Group%, %A_ScriptDir%\flaskconfig.ini, Main, Flask5Group
IniWrite, %Flask5Quick%, %A_ScriptDir%\flaskconfig.ini, Main, Flask5Quick
IniWrite, %Flask5Key%, %A_ScriptDir%\flaskconfig.ini, Main, Flask5Key
IniWrite, %Flask5Duration%, %A_ScriptDir%\flaskconfig.ini, Main, Flask5Duration

IniWrite, %GroupPrefix%, %A_ScriptDir%\flaskconfig.ini, Main, GroupPrefix
IniWrite, %GroupSuffix%, %A_ScriptDir%\flaskconfig.ini, Main, GroupSuffix
IniWrite, %QuickPrefix%, %A_ScriptDir%\flaskconfig.ini, Main, QuickPrefix
IniWrite, %QuickSuffix%, %A_ScriptDir%\flaskconfig.ini, Main, QuickSuffix
Reload
}

Load(){
local empty_var
IniRead, Flask1Group, %A_ScriptDir%\flaskconfig.ini, Main, Flask1Group, 1
IniRead, Flask1Quick, %A_ScriptDir%\flaskconfig.ini, Main, Flask1Quick, 0
IniRead, Flask1Key, %A_ScriptDir%\flaskconfig.ini, Main, Flask1Key, 1
IniRead, Flask1Duration, %A_ScriptDir%\flaskconfig.ini, Main, Flask1Duration, 8000

IniRead, Flask2Group, %A_ScriptDir%\flaskconfig.ini, Main, Flask2Group, 1
IniRead, Flask2Quick, %A_ScriptDir%\flaskconfig.ini, Main, Flask2Quick, 0
IniRead, Flask2Key, %A_ScriptDir%\flaskconfig.ini, Main, Flask2Key, 2
IniRead, Flask2Duration, %A_ScriptDir%\flaskconfig.ini, Main, Flask2Duration, 8000

IniRead, Flask3Group, %A_ScriptDir%\flaskconfig.ini, Main, Flask3Group, 0
IniRead, Flask3Quick, %A_ScriptDir%\flaskconfig.ini, Main, Flask3Quick, 1
IniRead, Flask3Key, %A_ScriptDir%\flaskconfig.ini, Main, Flask3Key, 3
IniRead, Flask3Duration, %A_ScriptDir%\flaskconfig.ini, Main, Flask3Duration, 4700

IniRead, Flask4Group, %A_ScriptDir%\flaskconfig.ini, Main, Flask4Group, 0
IniRead, Flask4Quick, %A_ScriptDir%\flaskconfig.ini, Main, Flask4Quick, 1
IniRead, Flask4Key, %A_ScriptDir%\flaskconfig.ini, Main, Flask4Key, 4
IniRead, Flask4Duration, %A_ScriptDir%\flaskconfig.ini, Main, Flask4Duration, 4000

IniRead, Flask5Group, %A_ScriptDir%\flaskconfig.ini, Main, Flask5Group, 1
IniRead, Flask5Quick, %A_ScriptDir%\flaskconfig.ini, Main, Flask5Quick, 0
IniRead, Flask5Key, %A_ScriptDir%\flaskconfig.ini, Main, Flask5Key, 5
IniRead, Flask5Duration, %A_ScriptDir%\flaskconfig.ini, Main, Flask5Duration, 4000

IniRead, GroupPrefix, %A_ScriptDir%\flaskconfig.ini, Main, GroupPrefix, %empty_var%
IniRead, GroupSuffix, %A_ScriptDir%\flaskconfig.ini, Main, GroupSuffix, space
IniRead, QuickPrefix, %A_ScriptDir%\flaskconfig.ini, Main, QuickPrefix, %empty_var%
IniRead, QuickSuffix, %A_ScriptDir%\flaskconfig.ini, Main, QuickSuffix, \
}