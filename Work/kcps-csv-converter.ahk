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

#Include Lib\csv.ahk


;**** Functions ***************************************************************

ConvertKCPSLedger(fileName)
{

	ToolTip, Starting Conversion...

	CSV_Load(fileName,"data")

	CSV_DeleteColumn("data",41)
	CSV_DeleteColumn("data",40)
	CSV_DeleteColumn("data",39)
	CSV_DeleteColumn("data",38)
	CSV_DeleteColumn("data",37)
	CSV_DeleteColumn("data",36)
	CSV_DeleteColumn("data",35)
	CSV_DeleteColumn("data",34)
	CSV_DeleteColumn("data",33)
	CSV_DeleteColumn("data",32)
	CSV_DeleteColumn("data",31)
	CSV_DeleteColumn("data",30)
	CSV_DeleteColumn("data",29)
	CSV_DeleteColumn("data",28)
	CSV_DeleteColumn("data",27)
	CSV_DeleteColumn("data",26)
	CSV_DeleteColumn("data",25)
	;CSV_DeleteColumn("data",24)
	CSV_DeleteColumn("data",23)
	CSV_DeleteColumn("data",22)
	CSV_DeleteColumn("data",21)
	CSV_DeleteColumn("data",20)
	CSV_DeleteColumn("data",19)
	CSV_DeleteColumn("data",18)
	;CSV_DeleteColumn("data",17)
	CSV_DeleteColumn("data",16)
	CSV_DeleteColumn("data",15)
	CSV_DeleteColumn("data",14)
	CSV_DeleteColumn("data",13)
	;CSV_DeleteColumn("data",12)
	CSV_DeleteColumn("data",11)
	CSV_DeleteColumn("data",10)
	CSV_DeleteColumn("data",9)
	CSV_DeleteColumn("data",8)
	;CSV_DeleteColumn("data",7)
	CSV_DeleteColumn("data",6)
	CSV_DeleteColumn("data",5)
	;CSV_DeleteColumn("data",4)
	;CSV_DeleteColumn("data",3)
	CSV_DeleteColumn("data",2)
	CSV_DeleteColumn("data",1)

	CSV_AddColumn("data", "description")

	TotalRows := CSV_TotalRows("data")
	RowCounter := TotalRows


	BannedMemos := "Beginning balance"
	BannedAccounts := "Undeposited Funds,MF/Convenience Fee,PROPERTY Rents,MF/ Late Fee ,KCPS  Late Fee Income,Owner Contribution,Security Deposit Liability,SECURITY DEPOSITS,MF/ Application Fee"

	while RowCounter >= 1
	{
		Memo := CSV_ReadCell("data", RowCounter, 2)
		IfInString, BannedMemos, %Memo%
		{
			CSV_DeleteRow("data",RowCounter)
		}
		else
		{
			AccountName := CSV_ReadCell("data", RowCounter, 4)
			IfInString, BannedAccounts, %AccountName%
			{
				CSV_DeleteRow("data",RowCounter)
			}
		}
		
		RowCounter--
	}
	RowCounter := 2

	while RowCounter <= TotalRows
	{
		Date := CSV_ReadCell("data", RowCounter, 1)
		word_array := StrSplit(Date, A_Space)
		Date := word_array[1]
		CSV_ModifyCell("data",Date,RowCounter,1)
		
		AccountName := CSV_ReadCell("data", RowCounter, 4)
		PayeeName := CSV_ReadCell("data", RowCounter, 5)
		BuildingName := CSV_ReadCell("data", RowCounter, 6)
		Memo := CSV_ReadCell("data", RowCounter, 2)
		RowDescription = %AccountName% - %PayeeName% - %BuildingName% - %Memo%
		CSV_ModifyCell("data", RowDescription, RowCounter, 7)
		RowCounter++
	}

	SaveFileName := RegExReplace(fileName, "\.csv$", "_converted.csv")

	CSV_Save(SaveFileName, "data") ; just you can see how it looks
	ToolTip, Finished!
	SetTimer, RemoveToolTip, -2000
}


RemoveToolTip:
	ToolTip
return