Import-Module .\Test-ReparsePoint.psm1
Import-Module .\Convert-Decision.psm1

$target_dir = "$HOME\.config\powershell\"

$file = "user_profile.ps1"
$src_dir = Join-Path -Path (Get-Location) -ChildPath "win_home\$file"

if (Test-Path -Path $target_dir)
{
  Write-Output "Target folder exists"
  $target_file = Join-Path -Path $target_dir -ChildPath $file

  $file_exists = Test-Path -Path $target_file
  if($file_exists)
  {
    $is_symlink = Test-ReparsePoint($target_file)

    if(-not ($is_symlink))
    {
      
      $decision = Read-Host -Prompt "File exists. Do you want to remove the file to create a symlink? Warning: This will remove everything within the folder`n"
      $decision = Convert-Decision($decision)

      if($decision)
      {
        Write-Output "Removing $target_file"
        Remove-Item $target_file
      }
      else 
      {
        Write-Output "Stopping operation..."
      }
    }
    else
    {
      Write-Output "Target file is a symlink"
    }
  }
}
else
{
  Write-Output "Target folder does not exist. Creating..."
  New-Item -Path $target_dir -ItemType Directory


}
if ($decision -or -not($file_exists))
{
  New-Item -ItemType SymbolicLink -Path $target_file -Target $src_dir
	Write-Output "Symlink created"
}

# Link user profile to current host
Write-Output "Linking user profile"
". $env:USERPROFILE\.config\powershell\user_profile.ps1" | Out-File -FilePath $PROFILE.CurrentUserCurrentHost
