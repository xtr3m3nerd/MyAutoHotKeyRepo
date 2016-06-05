;******************************************************************************
; AutoHotkey Version: 1.1
; Language:       English
; Author:         Xavier Vargas <Xtr3m3nerd@gmail.com>
;                         Copyright(C) 2016
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
;		Functionality: Functions for changing windows sounds settings 
;
;       Warning: Declares global variable SoundToggle
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


;**** Sound Device Functions **************************************************

ToggleSoundDevice(deviceNumber1, deviceNumber2)
{
  global SoundToggle:=!SoundToggle
  
  if SoundToggle
    SetSoundDevice(deviceNumber1)
  Else
    SetSoundDevice(deviceNumber2)
}

SetSoundDevice(deviceNumber)
{
  Run, mmsys.cpl
  Winhide,Sound
  WinWait,Sound
  
  Loop %deviceNumber%
  {
    ControlSend,SysListView321,{Down 1}
  }
	
  sleep 50
  ControlClick,&Set Default,Sound,,,,na
  sleep 50
  ControlClick,OK,Sound,,,,na
  sleep 50

  WinClose,Sound
}