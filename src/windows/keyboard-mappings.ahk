; Autohotkey key mappings to change standard keyboard layout to my preffered one.

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Turn Caps Lock into Control
#Persistent
SetCapsLockState, AlwaysOff

Capslock::Ctrl
