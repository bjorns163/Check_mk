'CheckReboot.vbs - checks registry keys to determine if machine needs to reboot.
' Returns 1 if reboot is required, 0 if not

Function ReadRegistry (RegPath)
	Set oReg = CreateObject ("Wscript.shell")
	ReadRegistry = oReg.RegRead (RegPath)
End Function

iReturn = 0
On Error Resume Next

iReturn = iReturn + CInt (ReadRegistry ("HKLM\Software\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending"))
iReturn = iReturn + CInt (ReadRegistry ("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"))
iReturn = iReturn + CInt (ReadRegistry ("HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\PendingFileRenameOperations"))

 Set objSysInfo = CreateObject("Microsoft.Update.SystemInfo")
'Wscript.Echo "Reboot required? " & objSysInfo.RebootRequired

If objSysInfo.RebootRequired = True Then
	iReturn = iReturn + 1
End If
If iReturn = 0 Then
	WScript.Echo ("0 Monitor_Reboot_Updates count="& iReturn &";0;1;0; OK - No Reboot needed for Windows updates")
ElseIf iReturn = 1 Then
	WScript.Echo ("2 Monitor_Reboot_Updates count="& iReturn &";0;1;0; CRITICAL - Reboot needed for Windows updates!")
End If
WScript.Quit()   