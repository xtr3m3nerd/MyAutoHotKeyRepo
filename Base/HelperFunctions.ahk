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


;**** Functions ***************************************************************

; function to open notepad if a fresh instance isn't open yet. 
OpenNotepad()
{
	IfWinExist Untitled - Notepad
		WinActivate
	else
		Run Notepad
}

; function to autohotkey help if a fresh instance isn't open yet. 
OpenAutoHotKeyHelp()
{
	IfWinExist AutoHotkey Help
		WinActivate
	else
		Run C:\Program Files (x86)\AutoHotkey\AutoHotkey.chm
}