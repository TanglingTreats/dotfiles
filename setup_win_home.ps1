# Symlink user profile

$target_dir = "$HOME\.config\powershell\"

if (Test-Path -Path $target_dir)
{
  Write-Output "Target folder exists"
}
else
{
  Write-Output "Target folder does not exist. Creating..."
  New-Item -Path $target_dir -ItemType Directory
}
