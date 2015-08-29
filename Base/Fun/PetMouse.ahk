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
;		Functionality: My AutoHotKey Mouse personality 
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


; Needs to be refactored  before integrating with system. 

; canPetMouseActivate := false

; ^#Numpad1:: canPetMouseActivate = !canPetMouseActivate


; CheckMouseActivity()
; {
     ; MouseGetPos, X, Y

     ; if X = %lastX%
     ; {
          ; if Y = %lastY%
          ; {
               ; petMouseActive = true
          ; }
     ; }

     ; lastX := X 
     ; lastY := Y  
; }


; petMouseInitialize()
; {
     ; count := 0
     ; speed := 5
     ; craze := 5
     ; speakCounter := 0
     ; Random, speakCounter, 50, 500
     ; Random, destX, 0, A_ScreenWidth
     ; Random, destY, 0, A_ScreenHeight
     ; ;Progress, b h20 ZH10 w100,,, Health Bar
     ; ;     Progress, 75,,, Health Bar 
; }

; petMouseLoop()
; {
     ; Random, randX, 0, A_ScreenWidth
     ; Random, randY, 0, A_ScreenHeight
     ; Random, voli, 0, craze
     ; MouseGetPos, X, Y
     ; Normalize(dX,dY,dZ,randX-X,randY-Y,0)
     ; Normalize(vX,vY,vZ,destX-X,destY-Y,0)
     ; MouseMove X+vX*speed+dX*voli, Y+vY*speed+dY*voli
     ; ;WinMove, Health Bar,,X-50,Y-30
     ; Sleep 50
     ; if count = %speakCounter%
     ; {
          ; ; ShowMouseHealth(100)
          ; ToolTip, Rawr! I am a mouse curser!
          ; Sleep 1500
          ; ToolTip
          ; count := 0
          ; Random, speakCounter, 0, 100
     ; }
     ; dist := Length(X,Y,0,destX,destY,0)
     ; if dist < 5
     ; {
          ; Random, destX, 0, A_ScreenWidth
          ; Random, destY, 0, A_ScreenHeight
          ; Random, speed, 3, 20
          ; Random, craze, 1, 20
     ; }
     ; count := count+1
     ; if not livingMouseRunning 
          ; break
; }

; petMouseAI()
; {
     ; GetMouseSensors()
     ; WorldState()
     ; Loop possibleActions
     ; {
          ; WorldChangesDueToActions()
          ; UtilityOfResultingState()
     ; }
     ; ActionOfHighestUtility()
     ; PerformAction()
; }

; ;MouseState is defined by
; ; Pos
; ; Velocity
; ; Current Goal
; ; Health
; ; Active


; GetMouseSensors()
; {
     ; CoordMode, Mouse, Screen
     ; MouseGetPos, X, Y
     ; CoordMode, Mouse, Relative
; }







; #MaxThreadsPerHotkey 3
; ^#Numpad1::
; #MaxThreadsPerHotkey 1
; if livingMouseRunning 
; {
    ; livingMouseRunning  := false  
    ; return  
; }
; livingMouseRunning  := true
; CoordMode, Mouse, Screen
; count := 0
; speed := 5
; craze := 5
; speakCounter := 0
; Random, speakCounter, 50, 500
; Random, destX, 0, A_ScreenWidth
; Random, destY, 0, A_ScreenHeight
; ;Progress, b h20 ZH10 w100,,, Health Bar
; ;	Progress, 75,,, Health Bar 
; Loop
; {
   	; Random, randX, 0, A_ScreenWidth
	; Random, randY, 0, A_ScreenHeight
	; Random, voli, 0, craze
	; MouseGetPos, X, Y
        ; Normalize(dX,dY,dZ,randX-X,randY-Y,0)
	; Normalize(vX,vY,vZ,destX-X,destY-Y,0)
	; MouseMove X+vX*speed+dX*voli, Y+vY*speed+dY*voli
	; ;WinMove, Health Bar,,X-50,Y-30
	; Sleep 50
	; if count = %speakCounter%
        ; {
	     ; ; ShowMouseHealth(100)
             ; ToolTip, Rawr! I am a mouse curser!
             ; Sleep 1500
             ; ToolTip
             ; count := 0
             ; Random, speakCounter, 0, 100
        ; }
	; dist := Length(X,Y,0,destX,destY,0)
	; if dist < 5
	; {
	     ; Random, destX, 0, A_ScreenWidth
	     ; Random, destY, 0, A_ScreenHeight
	     ; Random, speed, 3, 20
	     ; Random, craze, 1, 20
	; }
	; count := count+1
    ; if not livingMouseRunning 
        ; break
; }
; livingMouseRunning  := false  
; Progress, Off
; CoordMode, Mouse, Relative
; return

; ShowMouseHealth(Health)
; {
     ; CoordMode, Mouse, Screen
     ; Progress, b h20 ZH10 w100,,, Health Bar
     ; MouseGetPos, X, Y
     ; WinMove, Health Bar,,X-50,Y-30
     ; Progress, %Health%,,, Health Bar 
     ; Sleep 1000
     ; Progress, Off
     ; CoordMode, Mouse, Relative
     ; Return
; }