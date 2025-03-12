reg import .\registryChanger.reg

Write-Host "To apply the changes, you will need to restart File Explorer or your PC. Would you like to restart File Explorer now?"
$userInput = Read-Host "[Yes]: y, [No]: n"

switch ($userInput) {
  "y" {
    Get-Process Explorer | Stop-Process
    Start-Process Explorer   
  } 
  "n" { 
    return
  }
  Default {
    throw "input error"
  }
}

Pause

