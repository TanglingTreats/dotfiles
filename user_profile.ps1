# Modules
# Import-Module posh-git
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\amro.omp.json" | Invoke-Expression

$env:POSH_GIT_ENABLED = $true

function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a blinking block.
        Write-Host -NoNewLine "`e[1 q"
    } else {
        # Set the cursor to a blinking line.
        Write-Host -NoNewLine "`e[5 q"
    }
}
Set-PSReadlineOption -EditMode vi -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange
#Set-PSReadlineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange

# Aliases
Set-Alias vim nvim

Set-Alias prg_dir ProgrammingDir
Function ProgrammingDir {cd ~\Documents\Programming}

Set-Alias back BackDir
Function BackDir {cd -}
