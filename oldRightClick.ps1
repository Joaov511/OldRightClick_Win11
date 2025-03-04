#reg import .\registryChanger.reg

if ( $null -eq ('System.Windows.MessageBox' -as [type]) ) {
    Add-Type -AssemblyName PresentationFramework
}

$msgBoxInput =  [System.Windows.MessageBox]::Show(
    "The changes to take effect you have to restart the File Explorer or restart the PC, Do you want to restart File Explorer?",
    'Warning',
    'YesNo')
switch  ($msgBoxInput) 
      {
          'Yes' {
            Get-Process Explorer | Stop-Process
            Start-Process Explorer 
          }
          'No' {
            Return
          }
      }