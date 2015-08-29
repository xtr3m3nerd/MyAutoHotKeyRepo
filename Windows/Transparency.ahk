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
;		Functionality: Provides functions for putting a window always on top,
;         Making a window semi transparent, and affecting whether or not it
;         is click throughable. 
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

;**** Globals *****************************************************************

current_hWnd := false


;**** Functions ***************************************************************

ToggleAlwaysOnTop()
{
	WinGet, currentWindow, ID, A
	WinGet, ExStyle, ExStyle, ahk_id %currentWindow%
	if (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST.
	{
		Winset, AlwaysOnTop, off, ahk_id %currentWindow%
		SplashImage,, x0 y0 b fs12, OFF always on top.
		Sleep, 1500
		SplashImage, Off
	}
	else
	{
		WinSet, AlwaysOnTop, on, ahk_id %currentWindow%
		SplashImage,,x0 y0 b fs12, ON always on top.
		Sleep, 1500
		SplashImage, Off
	}
}

ReduceTranparency()
{
	WinGet, currentWindow, ID, A
	WinGet, transparency, Transparent, ahk_id %currentWindow%
	if not (transparency)
	{
		transparency := 255
	}
	if (transparency > 5)
	{
		transparency -= 5
		WinSet, Transparent, %transparency%, ahk_id %currentWindow%
	}
	SplashImage,,w100 x0 y0 b fs12, %transparency%
	SetTimer, TurnOffSI, 1000, On
}

IncreaseTransparency()
{
	SplashImage, Off
	WinGet, currentWindow, ID, A
	WinGet, transparency, Transparent, ahk_id %currentWindow%
	if not (transparency)
	{
		transparency := 255
	}
	if (transparency < 255)
	{
		transparency += 5
		WinSet, Transparent, %transparency%, ahk_id %currentWindow%
	}
	SplashImage,, w100 x0 y0 b fs12, %transparency%
	SetTimer, TurnOffSI, 1000, On
}

MakeClickThroughable()
{
	Global current_hWnd
	if !current_hWnd
	{
		current_hWnd := winActive("A")
		Winset, Alwaysontop, ON
		WinSet, ExStyle, +0x80020
		
		SplashImage,, w300 x0 y0 b fs12
			, Active window is now click through-able
		SetTimer, TurnOffSI, 1000, On
	}	
}

MakeClickable()
{
	Global current_hWnd
	if(current_hWnd)
	{
		WinSet, ExStyle, -0x80020, ahk_id %current_hWnd%
		Winset, Alwaysontop, OFF, ahk_id %current_hWnd%
		current_hWnd := False
		
		SplashImage,, w300 x0 y0 b fs12
			, Click-through window has been restored
		SetTimer, TurnOffSI, 1000, On
	}	
}

TurnOffSI:
SplashImage, off
SetTimer, TurnOffSI, 1000, Off
Return