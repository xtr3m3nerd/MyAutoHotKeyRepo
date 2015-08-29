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
;		Functionality: miscellaneous fun functions
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

SplashGif(gifFile)
{
     SoundBeep
     SplashImage, gifFile, a b,,,Earth
     WinActivate, Earth
     Sleep, 2000
     SplashImage, Off
}

; #NoEnv
; CoordMode, Mouse ; Required: change coord mode to screen vs relative.
 
; LetUserSelectRect(x1, y1, x2, y2)
; ;MsgBox %x1%,%y1%  %x2%,%y2%

; !s::
	; DrawRect(0, 0, 100, 100)
; return 
 
; LetUserSelectRect(ByRef x1, ByRef y1, ByRef x2, ByRef y2)
; {
    ; static r := 3
    ; ; Create the "selection rectangle" GUIs (one for each edge).
    ; Loop 4 {
        ; Gui, %A_Index%: -Caption +ToolWindow +AlwaysOnTop
        ; ;Gui, %A_Index%: Color, Red
		; Gui, font, s1, Verdana
    ; }
	; Gui, 1: Color, Red
	; Gui, 2: Color, Blue
	; Gui, 3: Color, Green
	; Gui, 4: Color, Black
    ; ; Disable LButton.
    ; Hotkey, *LButton, lusr_return, On
    ; ; Wait for user to press LButton.
    ; KeyWait, LButton, D
    ; ; Get initial coordinates.
    ; MouseGetPos, xorigin, yorigin
    ; ; Set timer for updating the selection rectangle.
    ; SetTimer, lusr_update, 10
    ; ; Wait for user to release LButton.
    ; KeyWait, LButton
    ; ; Re-enable LButton.
    ; Hotkey, *LButton, Off
    ; ; Disable timer.
    ; SetTimer, lusr_update, Off
    ; ; Destroy "selection rectangle" GUIs.
    ; Loop 4
        ; Gui, %A_Index%: Destroy
    ; return
 
    ; lusr_update:
        ; MouseGetPos, x, y
        ; if (x = xlast && y = ylast)
            ; ; Mouse hasn't moved so there's nothing to do.
            ; return
        ; if (x < xorigin)
             ; x1 := x, x2 := xorigin
        ; else x2 := x, x1 := xorigin
        ; if (y < yorigin)
             ; y1 := y, y2 := yorigin
        ; else y2 := y, y1 := yorigin
        ; ; Update the "selection rectangle".	
		; x21 := (x2-x1)*0.8
		; y21 := (y2-y1)*0.8
		; SplashImage,, x0 y0 b fs12, %x1% %x2% %x21% %xorigin% %x%
        ; Gui, 1:Show, % "NA x" x1 " y" y1 " w" x21 " h" r
        ; Gui, 2:Show, % "NA X" x1 " Y" y2-r " W" x21 " H" r
        ; Gui, 3:Show, % "NA X" x1 " Y" y1 " W" r " H" y21
        ; Gui, 4:Show, % "NA X" x2-r " Y" y1 " W" r " H" y21
		; xlast := x
		; ylast := y
    ; lusr_return:
    ; return
; }

; DrawRect(x1, y1, x2, y2)
; {
	; static r := 3
	; Loop 4 {
        ; Gui, %A_Index%: -Caption +ToolWindow +AlwaysOnTop
        ; ;Gui, %A_Index%: Color, Red
    ; }
	; x21 := (x2-x1);*0.8
	; y21 := (y2-y1);*0.8
	; SplashImage,, x0 y0 b fs12, %x1% %x2% %x21% 
    ; Gui, 1:Show, % "NA x" x1 " y" y1 " w" x21 " h" r
    ; Gui, 2:Show, % "NA X" x1 " Y" y2-r " W" x21 " H" r
    ; Gui, 3:Show, % "NA X" x1 " Y" y1 " W" r " H" y21
    ; Gui, 4:Show, % "NA X" x2-r " Y" y1 " W" r " H" y21
	; return
	; Sleep, 1500
	; SplashImage, Off
	; Loop 4
        ; Gui, %A_Index%: Destroy
    ; return
; }

; ^#Numpad5::
     ; CoordMode, Mouse, Screen
     ; Progress, b h20 ZH10 w100,,, My Title
     ; count := 0
     ; Loop 100
     ; {
          ; MouseGetPos, X, Y
          ; WinMove, My Title,,X-50,Y-30
          ; Progress, %A_Index%,,, My Title ; Set the position of the bar to 50%.
          ; count := count+1
          ; Sleep 30
     ; }
     ; Sleep, 2000
     ; Progress, Off
     ; CoordMode, Mouse, Relative
; Return

; ^#Left::
     ; CoordMode, Mouse, Screen
     ; MouseGetPos, X, Y
     ; MouseMove A_ScreenWidth/4, Y
     ; CoordMode, Mouse, Relative
; Return

; ^#Right::
     ; CoordMode, Mouse, Screen
     ; MouseGetPos, X, Y
     ; MouseMove A_ScreenWidth*3/4, Y
     ; CoordMode, Mouse, Relative
; Return

; ^#Up::
     ; CoordMode, Mouse, Screen
     ; MouseGetPos, X, Y
     ; MouseMove X, A_ScreenHeight/4
     ; CoordMode, Mouse, Relative
; Return

; ^#Down::
     ; CoordMode, Mouse, Screen
     ; MouseGetPos, X, Y
     ; MouseMove X, A_ScreenHeight*3/4
     ; CoordMode, Mouse, Relative
; Return