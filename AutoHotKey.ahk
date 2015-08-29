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

;**** Includes ****************************************************************

#Include Base\HelperFunctions.ahk
#Include Windows\Transparency.ahk
#Include Windows\WinMover.ahk

;**** Hot Keys ****************************************************************

<^<!x::Run www.google.com
<^<!y::Run https://mail.yahoo.com
<^<!g::Run https://mail.google.com
<^<!c::Run C:\Windows\System32\SnippingTool.exe
<^<!n::OpenNotepad()
<^<!space::Send {Volume_Mute}


;**** AutoHotkey Dev/Help *****************************************************

<^<!s::Run %A_ScriptDir%
<^<!h::Run Notepad++.exe AutoHotkey.ahk
<^<!+h::OpenAutoHotKeyHelp()
<^<!r::Reload


;**** Window Transparency *****************************************************

<!a::ToggleAlwaysOnTop()
<!q::ReduceTranparency()
<!w::IncreaseTransparency()
<!<+r::MakeClickThroughable()
<!<+f::MakeClickable()


;**** Window Manipulation *****************************************************

<^<!Up::MoveWindowUp()
<^<!Left::MoveWindowLeft()
<^<!Down::MoveWindowDown()
<^<!Right::MoveWindowRight()
<^<!/::HalfCurrentWindow()
<^<!,::ListOutCurrentWindows()
<!t::AutoHideTaskBar()
<!<+t::ToggleAutoHideTaskBar()