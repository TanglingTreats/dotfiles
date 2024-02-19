# Modules
oh-my-posh init pwsh --config 'C:/Users/edwin/Posh/bubblesextra.omp.json' | Invoke-Expression

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

Set-Alias vs_dir VSWorkspaceDir
Function VSWorkspaceDir {cd ~\Documents\Programming\vs_workspaces}
