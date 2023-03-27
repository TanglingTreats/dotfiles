Import-Module .\Test-ReparsePoint.psm1

Function Convert-Decision([string]$decision)
{
	if($decision -match "[y]")
	{
		return $true
	}
	else
	{
		return $false
	}
}

$target_dir = "$HOME\AppData\Local\"
$target_folder = "nvim"

$base_src_dir = (Get-Item .).FullName
$src_dir = Join-Path -Path $base_src_dir -ChildPath "config"
$src_dir = Join-Path -Path $src_dir -ChildPath "nvim"

# Check if folder exists
$folder_exists = $false
Get-ChildItem $target_dir | Foreach-Object {
	#Write-Output $_.Name
	if ($_.Name -eq $target_folder)
	{
		$folder_exists = $true
		$folder_is_symlink = Test-ReparsePoint($_)
	}
}

if ($folder_exists)
{
	Write-Output "Folder exists"
	$folder_exists = $true
	if($folder_is_symlink)
	{
		Write-Output "Folder exists as a symlink!"
	}
	else
	{
		$decision = Read-Host -Prompt "Do you want to remove the folder to create a symlink? Warning: This will remove everything within the folder`n"
		$decision = Convert-Decision($decision)

		if($decision) {
			$target = Join-Path -Path $target_dir -ChildPath $target_folder
			Write-Output "Deleting $target"
			Remove-Item -Recurse -Force $target
		}
	}
}
else
{
	Write-Output "nvim folder does not exist, creating symlink"
}

if ($decision -or -not($folder_exists))
{
	New-Item -ItemType SymbolicLink -Path (Join-Path -Path $target_dir -ChildPath $target_folder) -Target $src_dir
	Write-Output "Symlink created"
}
