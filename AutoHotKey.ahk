;******************************************************************************
; AutoHotkey Version: 1.1
; Language:       English
; Author:         Xavier Vargas <Xtr3m3nerd@gmail.com>
;                         Copyright(C) 2019
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
;		Functionality: Starting script with mapped keys and library references
;
;
;******************************************************************************
;

; Special Character Reference
; ¢¤¥¦§©ª«®µ¶


;**** Directives & Settings ***************************************************

#NoEnv  ; Recommended for compatibility with future AutoHotkey releases.
#SingleInstance force ; Reset this instance ever restart
SendMode Input  ; Recommended for new scripts for speed and reliability 
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetMouseDelay, -1 ; Remove mouse delay to allow rapid response 

;**** Includes ****************************************************************

#Include Base\HelperFunctions.ahk
#Include Windows\Transparency.ahk
#Include Windows\WinMover.ahk
#Include Windows\Sounds.ahk

#Include Work\WorkHelperFunctions.ahk
#Include Work\kcps-csv-converter.ahk


;**** Timers ******************************************************************

SetTimer, TimedCapture, 900000 ; updates every 15 minute


;**** Hot Keys ****************************************************************

<^<!x::Run www.google.com
<^<!d::Run https://drive.google.com/
<^<!f::Run https://docs.google.com/spreadsheets/d/14u7IcIiq9p-CWaZVv3EwM-QjVsSwMC1ZvareDf7doao/edit#gid=607151010
<^<!v::Run https://docs.google.com/spreadsheets/u/0/
<^<!b::Run https://docs.google.com/document/u/0/
<^<!y::Run https://mail.yahoo.com
<^<!g::Run https://mail.google.com
<^<!c::Run C:\Windows\System32\SnippingTool.exe
<^<!n::OpenNotepad()
<^<!Space::Send {Volume_Mute}
<^<!PgUp::Send {Volume_Up}
<^<!PgDn::Send {Volume_Down}
#PrintScreen::CaptureScreen()


;**** Disable CapsLock  *******************************************************

CapsLock::		; CapsLock
+CapsLock::	; Shift+CapsLock
!CapsLock::	; Alt+CapsLock
^CapsLock::		; Ctrl+CapsLock
#CapsLock::		; Win+CapsLock
;^!CapsLock::	; Ctrl+Alt+CapsLock
^!#CapsLock::	; Ctrl+Alt+Win+CapsLock
;............	; You can add whatever you want to block
return			; Do nothing, return

;**** AutoHotkey Dev/Help *****************************************************

<^<!s::Run %A_ScriptDir%
<^<!h::Run Notepad++.exe AutoHotkey.ahk
<^<!+h::OpenAutoHotKeyHelp()
<^<+`::OpenWindowSpy()
<^<!r::Reload


;**** Window Transparency *****************************************************

>!a::ToggleAlwaysOnTop()
>!q::ReduceTranparency()
>!w::IncreaseTransparency()
>!>+r::MakeClickThroughable()
>!>+f::MakeClickable()


;**** Vim Movements ***********************************************************

<!<+k::Send {Up}
<!<+h::Send {Left}
<!<+j::Send {Down}
<!<+l::Send {Right}
<!<+u::Send {PgUp}
<!<+d::Send {PgDn}

;**** Vim Mouse Movements *****************************************************

*<^<#k::MouseMove, 0, 30, 1, R
*<^<#h::MouseMove, -30, 0, 1, R
*<^<#j::MouseMove, 0, -30, 1, R
*<^<#l::MouseMove, 30, 0, 1, R
<^<#Space::Click
<^<#<+Space::Click right


;**** Window Manipulation *****************************************************

<^<!Up::MoveWindowUp()
<^<!Left::MoveWindowLeft()
<^<!Down::MoveWindowDown()
<^<!Right::MoveWindowRight()
<^<!/::HalfCurrentWindow()
<^<!,::ListOutCurrentWindows()
<!t::AutoHideTaskBar()
<!<+t::ToggleAutoHideTaskBar()


<^<!1::MoveWindowToPos(1)
<^<!2::MoveWindowToPos(2)
<^<!3::MoveWindowToPos(3)
<^<!4::MoveWindowToPos(4)
<^<!5::MoveWindowToPos(5)
<^<!6::MoveWindowToPos(6)
<^<!7::MoveWindowToPos(7)
<^<!8::MoveWindowToPos(8)


;**** Sound Device ************************************************************

ScrollLock::ToggleSoundDevice(7,9)


;**** Mouse Captures **********************************************************

<^<+LButton::CaptureMouse(true)
<^<!LButton::CaptureMouse(false)


;**** Work HotKeys ************************************************************

<^<+Left:: Send #{Left}
<^<+Right:: Send #{Right}

$#z::
	Clipboard =
	SendInput  ^c
	Sleep 100 ;Allow some time for OnClipboardChange subroutine to run (if the clipboard has changed)
	If ! Errorlevel
		Clipboard := Clipboard
		
	If FileExist(Clipboard) and RegExMatch(Clipboard, "\.csv$")
		ConvertKCPSLedger(Clipboard)
	Else
		SendInput #z
return


;**** Timer Callbacks *********************************************************
TimedCapture:
	CaptureScreen()
Return

<^<!t::ShowTime()

;**** POE Hotkeys *********************************************************
#IfWinActive ahk_class POEWindowClass
<^1:: Run Other\POEFlaskMacros.ahk
<^2:: Run Other\POE-TradeMacro-2.14.1\Run_TradeMacro.ahk
#IfWinActive
	

