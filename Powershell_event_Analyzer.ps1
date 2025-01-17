// Powershell script to analyse the event logs generated after enabling Script logging and Module logging
// using the powershell scripts
// https://github.com/timip/splunk/blob/master/powershell_logging.ps1

$inputFile = Microsoft-Windows-PowerShellOperational.evtx";
$events = Get-WinEvent -FilterHashtable @{Path=$inputFile;} | Where-Object {$_.Id -eq 4104}

# Reverse the order of events
$reversedEvents = $events | Sort-Object TimeCreated ;

$i = 0;
$count = 1;
while($i -lt $reversedEvents.Length ){
    $event_ = $reversedEvents[$i];
    $messageNumber = $event_.Properties.Value[0];
    $totalMessage = $event_.Properties.Value[1];
    $script = $event_.Properties.Value[2];
    $value = "";
    while($messageNumber -lt $totalMessage){
        $value += $script;
        $i += 1;
        $event_ = $reversedEvents[$i];
        $messageNumber = $event_.Properties.Value[0];
        $script = $event_.Properties.Value[2];
    }
    if($messageNumber -eq $totalMessage){
        $value += $script;
    }
    $i += 1;
    $filename = "Transcript$count.p1";
    Set-Content -Path $filename -Value $value;
    Write-Host "Writing transcript $count in $filename";
    $count += 1;
}
