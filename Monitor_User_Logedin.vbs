Dim user 
user = "Administrator"
Dim strCmd
    strCmd = "cmd /q /c ""quser "&user&" | find /i """&user&""" "" "
	'WScript.Echo strCmd

Dim buffer 
    buffer = WScript.CreateObject("WScript.Shell").Exec(strCmd).StdOut.ReadAll()
	'WScript.Echo buffer

dim status, statustext
	If buffer <> "" Then
		status = 0
		statustext = ("OK")
		WScript.Echo (status & " Monitor-"&user&"-Login status="&status&";1;2;0; " & statustext & " - The User  "&user&" is logged in.")
		'WScript.Echo consoleUserName
	Else
		status = 2
		statustext = ("CRITICAL")
		WScript.Echo (status & " Monitor-"&user&"-Login  status="&status&";1;2;0; " & statustext & " - The User  "&user&" is not logged in!! Please login.")
		'WScript.Echo consoleUserName
	End If
WScript.Quit()