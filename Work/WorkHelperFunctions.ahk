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
;		Functionality: Common scripts to support functionality I use at work
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

OpenOutlook(bCalender)
{
	IfWinExist - Outlook
		WinActivate
	else
	{
		Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2013\Outlook 2013
		Sleep 3000
	}
	WinGetPos,,, Width, Height, A
	y := Height - 50
	if (bCalender)
	{
		Click  140, %y%
	}else{
		Click  50, %y%
	}
}

OpenOnenote()
{
	IfWinExist - OneNote
		WinActivate
	else
		Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2013\OneNote 2013
}

; NextWinTitle(Title)
; {
	; WinGet, var, Count, %Title%
	; if(var > 1)
	; {			
		; WinGet, fensterID, List, %Title%
		; WinActivate, % "ahk_id " fensterID%var%
	; }
; }

; PrevWinTitle(Title)
; {
	; WinGet, var, Count, %Title%
	; if(var > 1)
	; {			
		; WinGet, fensterID, List, %Title%
		; WinActivate, % "ahk_id " fensterID2
	; }
; }

; WindowType()
; {
	; WinGetTitle, Title, A
	; IdentText =  %A_Space%-%A_Space% 
	; StringGetPos, pos, Title, %IdentText%, R
	; StringTrimLeft, winType, Title, pos
	; return winType
; }

; ^!.::
	; thisWinType := WindowType()
	; NextWinTitle(thisWinType)
; Return

; ^!,::
	; thisWinType := WindowType()
	; PrevWinTitle(thisWinType)
; Return

