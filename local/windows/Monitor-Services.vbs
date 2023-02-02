dim status, statustext
serviceName1 = "Milestone Image Import Service"
serviceName2 = "Milestone Image Server"
serviceName3 = "Milestone Log Check Service"



Set wmi = GetObject("winmgmts://./root/cimv2")
state1 = wmi.Get("Win32_Service.Name='" & serviceName1 & "'").State
state2 = wmi.Get("Win32_Service.Name='" & serviceName2 & "'").State
state3 = wmi.Get("Win32_Service.Name='" & serviceName3 & "'").State


'WScript.Echo state
if state1 = "Running" and state2 = "Running" and state3 = "Running" then
status = 0
statustext = ("OK")
elseif state1 = "Start Pending" or state1 = "Continue Pending" and state2 ="Start Pending" or state2 = "Continue Pending" and state3 ="Start Pending" or state3 = "Continue Pending" then
statustext = ("WARNING")
elseif state1 = "Stopped" or state1 = "Stop Pending" or state1 = "Pause Pending" or state1 = "Paused" or state1 = "Unknown" and state2 = "Stopped" or state2 = "Stop Pending" or state2 = "Pause Pending" or state2 = "Paused" or state2 = "Unknown" and state3 = "Stopped" or state3 = "Stop Pending" or state3 = "Pause Pending" or state3 = "Paused" or state3 = "Unknown" then
status = 2
statustext = ("CRITICAL")
else
status = 1
statustext = ("WARNING")
end if

'output van de check
If status = 0 then
 WScript.Echo (status & " Monitor-Milestone-Services status="&status&";1;2;0; " & statustext & " - is de status van de Milestone Services")
 WScript.Quit()
Else
 WScript.Echo (status & " Monitor-Milestone-Services status="&status&";1;2;0; " & statustext & " - De services die nodig zijn voor Milestone draaien niet correct.")
 WScript.Quit()
end if