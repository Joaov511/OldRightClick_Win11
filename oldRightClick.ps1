reg import .\registryChanger.reg

if ( $null -eq ('System.Windows.MessageBox' -as [type]) ) {
    Add-Type -AssemblyName PresentationFramework
}

$messageBoxInput =  [System.Windows.MessageBox]::Show(
    "To apply the changes, you will need to restart File Explorer or your PC. Would you like to restart File Explorer now?",
    'Warning',
    'YesNo')
switch  ($messageBoxInput) 
      {
          'Yes' {
            Get-Process Explorer | Stop-Process
            Start-Process Explorer 
          }
          'No' {
            Return
          }
      }