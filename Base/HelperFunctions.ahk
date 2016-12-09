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
;		Functionality: Functions to wrap simple key functionality to keep key 
;        references down to one line for ease of readability and configuration. 
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

;#Include Windows\ScreenCap.ahk
#Include Lib\Gdip.ahk


;**** Functions ***************************************************************

; function to open notepad if a fresh instance isn't open yet. 
OpenNotepad()
{
	IfWinExist Untitled - Notepad
		WinActivate
	else
		Run Notepad
}

; function to AutoHotKey help if a fresh instance isn't open yet. 
OpenAutoHotKeyHelp()
{
	IfWinExist AutoHotkey Help
		WinActivate
	else
		Run C:\Program Files (x86)\AutoHotkey\AutoHotkey.chm
}

; Opens Windows Spy Utility for AutoHotKey
OpenWindowSpy()
{
	IfWinExist Window Spy
		WinActivate
	else
		Run, C:\Program Files (x86)\AutoHotkey\AU3_Spy.exe
}

; Captures and reports the current Mouse coordinates relative to screen
CaptureMouse(bScreen)
{
	if(bScreen)
	{
		CoordMode, Mouse, Screen
	}else{
		CoordMode, Mouse, Relative
	}
	MouseGetPos, X, Y
	clipboard = %X%, %Y%
	ToolTip, X = %X%`n Y = %Y%.
	Sleep 2000
	ToolTip
}



CaptureScreen() 
{
	if( A_TimeIdlePhysical > 600000)
		Return
		
	 ; Create folder
	FormatTime, thedate, , dd_MM_yyyy
	IfNotExist, %thedate%
	{
		FileCreateDir, %thedate%
	}

	; Generate fileName 
	FormatTime, currentTime, , HH_mm
	newFileName := thedate "\img_" currentTime ".jpg"

	;Capture screenshot
	pToken := Gdip_Startup()

	pBitmap := Gdip_BitmapFromScreen()
	Gdip_SaveBitmapToFile(pBitmap, newFileName, 25)
	Gdip_DisposeImage(pBitmap)

	Gdip_Shutdown(pToken)
}

ShowTime()
{
	FormatTime, currentTime
	Progress, b zh0 fs24, %currentTime%
	Sleep, 2000
	Progress, Off
}