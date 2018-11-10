#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

ProcessName = GTA5.exe
WindowTitle = Grand Theft Auto V
FreezeDelay = 10000

if !FileExist("pssuspend.exe") {
	MsgBox, 4, MISSING DEPENENCIES!, PSTools pssuspend.exe is required to be in the same directory as this program.`n`n Would you like to open the browser to download it now?
	
	IfMsgBox, Yes
	    Run, https://docs.microsoft.com/en-us/sysinternals/downloads/pssuspend

	ExitApp
}

Numpad0::
if (WinActive(WindowTitle)) {
	Run, pssuspend.exe %ProcessName%,,Hide

	SoundBeep, 500, 500
	SoundBeep, 450, 150
	SoundBeep, 450, 150
	Sleep FreezeDelay
	SoundBeep, 700, 150
	SoundBeep, 700, 150

	Run, pssuspend.exe -r %ProcessName%,,Hide
}
