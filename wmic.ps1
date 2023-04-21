param ($Application, $Priority)
if ($Priority.ToLower() -eq "high") {
    Get-WmiObject Win32_process -filter "name = '$Application' "| foreach-object { $_.SetPriority(256) }
    Write-host($Application + " has been set to the highest priority level")
} elseif ($Priority.ToLower() -eq "normal") {
    Get-WmiObject Win32_process -filter "name = '$Application' "| foreach-object { $_.SetPriority(128) }
     Write-host($Application + " has been set to a normal priority level")
} elseif ($Priority.ToLower() -eq "low") {
    Get-WmiObject Win32_process -filter "name = '$Application' "| foreach-object { $_.SetPriority(64) }
    Write-host($Application + " has been set to a normal low level")
} elseif ($Priority.ToLower() -eq "lowest") {
    Get-WmiObject Win32_process -filter "name = '$Application' "| foreach-object { $_.SetPriority(32) }
    Write-host($Application + " has been set to the lowest priority level")
} else {
    Write-host("You must specify the process or service with it's extension and choose of the the following priority options: high, normal, low, lowest")
}
