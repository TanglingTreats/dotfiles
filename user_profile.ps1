# Oh My Posh
Import-Module posh-git
oh-my-posh init pwsh --config 'C:\Users\D1331622\posh-themes\amro.omp.json' | Invoke-Expression

# Powershell Vi mode
Set-PSReadlineOption -EditMode vi

function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a blinking block.
        Write-Host -NoNewLine "`e[1 q"
    } else {
        # Set the cursor to a blinking line.
        Write-Host -NoNewLine "`e[5 q"
    }
}
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange
