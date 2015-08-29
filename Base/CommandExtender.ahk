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
;		Functionality: My command line interpretor for doing silly quick 
;         commands with parameters
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


; Need to refactor!! 

; ;Command line for text editing 
; ; ¢¤¥¦§©ª«®µ¶

; ;Command Line formatting
; ;¤¤@Command### param param param ... ¤¤¤Execute(Optional)
; ;or
; ;¤¤@autohotkey### command param param param ... ¤¤¤Execute(Optional)

; ;Hotkey to enable command line
; ^+/::
; WinGetActiveTitle, activeWin
; InputBox, myCommand, "Text Command",,,200,100,,,,,"enter text command..."
; clipboard = %myCommand%
; DragonInterpreter(myCommand)
; Return

; ^+0::
; CommandFinder()
; Return

; ^+9::
; temp := Clipboard
; Send ^c
; StringLen, len, Clipboard
; Clipboard := temp
; ToolTip, %len%
; Sleep 1000
; ToolTip
; Return

; CommandFinder()
; {
    ; lead := "##@"
    ; trail := "###execute"
    ; winText := ""
    
    ; WinGetText, winText, A

    ; ; MsgBox % InStr(winText, %trail%,true,4)

    
    ; trail_pos := InStr(winText, %trail%,true,4) 
    
    ; IfInString, winText, %trail%
    ; {
	; StringGetPos, trail_pos, winText,%trail%
	; ; MsgBox, %trail% = %trail_pos%
        
        ; lead_pos := InStr(winText, %lead%) 
        
        ; IfInString, winText, %lead%
        ; {
            ; StringGetPos, lead_pos, winText, %lead%
            ; ; MsgBox, %lead% = %lead_pos%

	    ; StringMid, commandText, winText, lead_pos+4, (trail_pos-lead_pos-4)
            ; StringLen, trail_len,trail
            ; commandLength := trail_pos-lead_pos+trail_len
            ; loop %commandLength%
            ; {
                ; SendInput {BS}
            ; }
	    ; Sleep 100
	    ; MsgBox, Command text length = %commandLength%  Command = %commandText%            
            
        ; }
    ; }
    ; ; MsgBox, finished
; }

; DragonInterpreter(txtCommand)
; {

    ; StringReplace, newCommand, txtCommand, ###, `§, All  
    ; StringSplit, splitCommandArray, newCommand, `§, %A_Space%%A_Tab%
    
    ; ahk_string := "autohotkey"
    ; dragon_token = %splitCommandArray1%
    ; sendCommand = %splitCommandArray2% 
    ; IfNotInString, dragon_token, %ahk_string%
    ; {
        ; sendCommand = %splitCommandArray1%%A_Space%%sendCommand%
    ; } 

    ; CommandInterpreter(sendCommand)
; }

; CommandInterpreter(txtCommand)
; {
    ; len := StrLen(txtCommand)
    ; if len < 1 
        ; return

    ; StringReplace, newCommand, txtCommand, %A_SPACE%, `©  
    ; StringSplit, splitArray, newCommand, `©, %A_SPACE%%A_TAB%

    ; commandName = %splitArray1%
    ; if splitArray0 > 1
    ; {
        ; paramList = %splitArray2% 
    ; }

    ; MsgBox, Command = %commandName% with %paramList%

; }

; oldCommandInterpreter(txtCommand)
; {

; ;command list
; c_write_quit = wq
; c_alwaysquit = q!
; c_quit = q
; c_write = w
; c_edit = e
; c_quit_edit = e!


	; SoundBeep 100, 100
	; ToolTip %txtCommand%
	; Sleep 1000
	; if ( txtCommand == c_write_quit ) 
		; WriteQuit()
	; if ( txtCommand == c_quit )
		; Quit()

	; Return

; }


; Quit()
; {
	; Send !{F4}
	; Send !n
	; Return
; }

; WriteQuit()
; {
	; Send ^s
	; Send !{F4}
	; Return
; }