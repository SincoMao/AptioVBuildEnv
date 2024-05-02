param (
    [string]$testName = "NULL",
    [string]$deviceID = "NULL",
    [string]$deviceIndex = "-1",
    [switch]$interactive = $false
 )

if ($env:PROCESSOR_ARCHITECTURE -eq "AMD64") {$TARGET_ARCHITECTURE = "x64"}
elseif ($env:PROCESSOR_ARCHITECTURE -eq "x86") {$TARGET_ARCHITECTURE = "x86"}
elseif ($env:PROCESSOR_ARCHITECTURE -eq "ARM") {$TARGET_ARCHITECTURE = "arm"}
else 
{ 
    echo "Architecture not supported." 
    exit 
}

if($interactive -eq $true)
{
    Start-Process -NoNewWindow -Wait -FilePath "$PSScriptRoot\Runner\$TARGET_ARCHITECTURE\StandaloneRunner.exe" -ArgumentList "-interactive"
}
elseif($testName -ne "NULL")
{
      if ($deviceID -ne "NULL")
      {
        Start-Process -NoNewWindow -Wait -FilePath "$PSScriptRoot\Runner\$TARGET_ARCHITECTURE\StandaloneRunner.exe" -ArgumentList "-testName `"$testName`" -deviceID `"$deviceID`""
      }
      elseif ($deviceIndex -ne "-1")
      {
        Start-Process -NoNewWindow -Wait -FilePath "$PSScriptRoot\Runner\$TARGET_ARCHITECTURE\StandaloneRunner.exe" -ArgumentList "-testName `"$testName`" -deviceIndex $deviceIndex"
      }
      else
      {
        echo "Usage:"
        echo "`t-interactive: run in full interactive mode."
        echo "`t-deviceID [device ID]: run on device with given ID"
        echo "`t-deviceIndex [#]: run on device with given number from previous run"
        echo "`t-testName [test name]: run test with the given name."
      }
   
}
else
{
        echo "Usage:"
        echo "`t-interactive: run in full interactive mode."
        echo "`t-deviceID [device ID]: run on device with given ID"
        echo "`t-deviceIndex [#]: run on device with given number from previous run"
        echo "`t-testName [test name]: run test with the given name."
}