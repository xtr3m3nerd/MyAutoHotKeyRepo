;******************************************************************************
; AutoHotkey Version: 1.1
; Language:       English
; Author:         Xavier Vargas <Xtr3m3nerd@gmail.com>
;                         Copyright(C) 2015
;
;____  ___ __        ________         ________                         .___
;\   \/  //  |_______\_____  \  _____ \_____  \  ____   ___________  __| _/
; \     /\   __\_  __ \_(__  < /     \  _(__  < /    \_/ __ \_  __ \/ __ | 
; /     \ |  |  |  | \/       \  Y Y  \/       \   |  \  ___/|  | \/ /_/ | 
;/___/\  \|__|  |__| /______  /__|_|  /______  /___|  /\___  >__|  \____ | 
;      \_/                  \/      \/       \/     \/     \/           \/     
;
;    This file is subject to the terms and conditions defined in
;      file 'LICENSE.txt', which is part of this source code package.
;
;
;		Functionality: Time tracking tool that assists in monitoring my 
;         own activity
;
;
;******************************************************************************
;

; Special Character Reference
; ¢¤¥¦§©ª«®µ¶

;**** Directives & Settings ***************************************************

#NoEnv  ; Recommended for compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts for speed and reliability 
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;**** Includes ****************************************************************


;**** Functions ***************************************************************

; #InstallKeybdHook
; #InstallMouseHook
; #SingleInstance force
; Menu, Tray, Icon, %A_WinDir%\system32\shell32.dll, 44
; Menu, Tray, Tip, ticker - A Simple Time Tracker`nPress right control to see details

; SetWorkingDir, C:\Users\%A_UserName%\Documents\TLG
; track_file_base := "track"
; SetTimer, CheckTime, 60000 ; updates every 1 minute
; SetTimer, TaskCheckup, 1800000 ; updates every 1 minute

; CheckTime:
    ; FormatTime, thedate, , dd_MM_yyyy
	; track_file = %track_file_base%_%thedate%.txt
	; FormatTime, currentHour, , dd_MM_yyyy_HH
	
	; if !DllCall("User32\OpenInputDesktop","int",0*0,"int",0*0,"int",0x0001L*1)
	; {
		; if(A_Hour < 8 || A_Hour > 17) 
			; return
		; AddTimeToWindow(track_file,currentHour,"Locked")
		; return
	; }
	
	; WinGetClass, winclass, A
	; WinGetTitle, wintitle, A
	; ClassAndTitle = "%winclass% - %wintitle%"
	; FileAppend %A_Now% - %ClassAndTitle%
		
	; AddTimeToWindow(track_file,currentHour,ClassAndTitle)

; Return

; TaskCheckup:
	; if DllCall("User32\OpenInputDesktop","int",0*0,"int",0*0,"int",0x0001L*1)
	; {
		; return
	; }
	; FormatTime, thedate, , dd_MM_yyyy
	; track_file = %track_file_base%_%thedate%.txt
	; FormatTime, currentHour, , dd_MM_yyyy_HH
	; InputBox, currentActivity, "Whatcha up to?",,,,,,,,300
	; FormatTime, thisTime, , hh:mm tt
	
	
	; if ErrorLevel = 2
	; {
		; key = UnknownActivity_%thisTime%
		; IniWrite "???", %track_file%, %currentHour%, %key%
		; Return
	; }
	
	; if currentActivity
	; {
		; key = CurrentActivity_%thisTime%
		; oldActivity := currentActivity
		; IniWrite %currentActivity%, %track_file%, %currentHour%, %key%
	; }
	; else
	; {
		; key = ContinueActivity_%thisTime%
		; IniWrite %oldActivity%, %track_file%, %currentHour%, %key%
	; }
		
	
; Return

; AddTimeToWindow(IniFile,IniSection,IniKey)
; {
	; time_in_minutes := 0
	; IniRead time_in_minutes, %IniFile%, %IniSection%, %IniKey%
	
	; if %time_in_minutes% = ERROR 
		; time_in_minutes = 0
	; else
		; time_in_minutes += 1
	
	; IniWrite %time_in_minutes%, %IniFile%, %IniSection%, %IniKey%
; }

; INI_Init(inifile = "inifile.ini"){
  ; global
  ; local key
  ; inisections:=0
 
  ; loop,read,%inifile%
  ; {
    ; if regexmatch(A_Loopreadline,"\[(\w+)]")
      ; {
        ; inisections+= 1
        ; section%inisections%:=regexreplace(A_loopreadline,"(\[)(\w+)(])","$2")
        ; section%inisections%_keys:=0
      ; }
    ; else if regexmatch(A_LoopReadLine,"(.*)=(.*)")
      ; {
        ; section%inisections%_keys+= 1
        ; key:=section%inisections%_keys
        ; section%inisections%_key%key%:=regexreplace(A_LoopReadLine,"(.*)=(.*)","$1")
      ; }
  ; }
; }

; INI_readAll(inifile="inifile.ini"){
  ; INI_load(inifile)
; }

; INI_load(inifile="inifile.ini"){
  ; global
  ; local sec,var
  ; loop,%inisections%
    ; {
      ; sec:=A_index
      ; loop,% section%a_index%_keys
        ; {
          ; var:=section%sec% "_" section%sec%_key%A_index%
		  ; key:=section%sec%_key%A_index%
		  ; StringReplace, key, key, -, _, All

          ; iniread, var,%inifile%,% section%sec%,key
        ; }
    ; }
; }

; rctrl:: 
  ; Gui, Destroy 
  ; Gui, Add, MonthCal, vDate 
  ; Gui, Add, Button,Default,OK 
  ; Gui, Show, x800 y200 
; Return 

; ButtonOK: 
; Gui,Submit 
; FormatTime, thedate, %date%, dd_MM_yyyy 
; track_file = %track_file_base%_%thedate%.txt
	; SoundBeep
	; FileDelete, report.txt
	; INI_Init(track_file)
	; loop,%inisections%
    ; {
      ; sec:=A_index
	  ; outsec:=section%sec%
	  ; FileAppend, %outsec%`n, report.txt
	  ; total := 0
      ; loop,% section%a_index%_keys
        ; {
          ; var:=section%sec% "_" section%sec%_key%A_index%
          ; iniread,var,%track_file%,% section%sec%,% section%sec%_key%A_index%
		  ; total += var
		  ; key:=section%sec%_key%A_index%
		  ; FileAppend, %var% = %key%`n, report.txt
        ; }
		; FileAppend, Total = %total%`n, report.txt
    ; }
	; Run, Notepad.exe report.txt
; Return 