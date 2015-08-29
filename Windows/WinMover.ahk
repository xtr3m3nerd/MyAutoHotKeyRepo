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
;		Functionality: Functions for moving windows around. 
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
DetectHiddenWindows, Off

;**** Includes ****************************************************************


;**** Directional Functions ***************************************************


MoveWindowUp()
{
	WinGetTitle, Title, A
	WinGetPos, Xpos, Ypos, Xwidth, Yheight, A
	if (Ypos = 0 && (Yheight < (A_ScreenHeight/2 + 10)))
	{
	WinMove,%Title%,,0,0,A_ScreenWidth,(A_ScreenHeight/2)
	}else{
	WinMove,%Title%,,X,0,Width,(A_ScreenHeight/2)
	}
}


MoveWindowLeft()
{
	WinGetTitle, Title, A
	WinGetPos, Xpos, Ypos, Xwidth, Yheight, A
	if (Xpos = 0 && (Ywidth < (A_ScreenWidth/2 + 10)))
	{
	WinMove,%Title%,,0,0,(A_ScreenWidth/2),A_ScreenHeight
	}else{
	WinMove,%Title%,,0,Y,(A_ScreenWidth/2),Height
	}
}

MoveWindowDown()
{
	WinGetTitle, Title, A
	WinGetPos, Xpos, Ypos, , , A
	if (Ypos = (A_ScreenHeight/2))
	{
	WinMove,%Title%,,0,(A_ScreenHeight/2),A_ScreenWidth,(A_ScreenHeight/2)
	}else{
	WinMove,%Title%,,X,(A_ScreenHeight/2),Width,(A_ScreenHeight/2)
	}
}

MoveWindowRight()
{
	WinGetTitle, Title, A
	WinGetPos, Xpos, Ypos, , , A
	if (Xpos = (A_ScreenWidth/2))
	{
	WinMove,%Title%,,(A_ScreenWidth/2),0,(A_ScreenWidth/2),A_ScreenHeight
	}else{
	WinMove,%Title%,,(A_ScreenWidth/2),Y,(A_ScreenWidth/2),Height
	}
}

;**** Sizing Functions ********************************************************

HalfCurrentWindow()
{
	WinGetTitle, Title, A
	WinGetPos, Xpos, Ypos, Xwidth, Yheight, A
	if (Xwidth < 250)
	{
	return
	}
	if (Xpos = 0)
	{
	WinMove,%Title%,,0,Y,(Xwidth/2),Yheight
	}else if ((Xpos+Xwidth) = A_ScreenWidth){
	WinMove,%Title%,,(Xpos+Xwidth/2),Y,(Xwidth/2),Yheight
	}else{
	WinMove,%Title%,,X,Y,(Xwidth/2),Yheight
	}
}

ListOutCurrentWindows()
{
	r =
	c := 0
	WinGet windows, List
	Loop %windows%
	{
		id := windows%A_Index%
		WinGetTitle wt, ahk_id %id%
		if((wt) && (wt != "Program Manager") && (wt != "RTDriver_FaceTracking"))
		{	
			r .= wt . "`n"
			c := c+1
		}
	}
	Xpos := 0
	Ypos := 0
	Xwidth := A_ScreenWidth/4
	Yheight := A_ScreenHeight/2
	c := 0
	Loop %windows%
	{
		id := windows%A_Index%
		WinGetTitle wt, ahk_id %id%
		if((wt)&& (wt != "Program Manager") 
		         && (wt != "RTDriver_FaceTracking") 
				 && (c<8))
		{	
			c := c+1
			WinRestore,%wt%,
			WinMove,%wt%,,Xpos,Ypos,Xwidth,Yheight
			Xpos := Xpos + Xwidth
			if(c = 4)
			{
				Xpos := 0
				Ypos := Ypos + Yheight
			}
			
		}
	}
}

;**** TaskBar Manipulation ****************************************************

AutoHideTaskBar()
{
	WinExist("ahk_class Shell_TrayWnd")

	t := !t
	If (t = "1") {
		WinHide, ahk_class Shell_TrayWnd
		WinHide, Start ahk_class Button
	} Else {
		WinShow, ahk_class Shell_TrayWnd
		WinShow, Start ahk_class Button
	}
}

ToggleAutoHideTaskBar()
{
	VarSetCapacity( APPBARDATA, 36, 0 )
	NumPut(36, APPBARDATA, 0, "UInt") ; First field is the size of the struct
	bits := DllCall("Shell32.dll\SHAppBarMessage"
    			,"UInt", 4 ; ABM_GETSTATE
    			,"UInt", &APPBARDATA )  
  NumPut( (bits ^ 0x1), APPBARDATA, 32, "UInt" ) ; Toggle Autohide
  DllCall("Shell32.dll\SHAppBarMessage"
    			,"UInt", ( ABM_SETSTATE := 0xA )
    			,"UInt", &APPBARDATA )
}