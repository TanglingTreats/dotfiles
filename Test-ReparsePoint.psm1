Function Test-ReparsePoint([string]$path) 
{
  $target = Get-Item $path -Force -ea SilentlyContinue
  return [bool]($target.Attributes -band [IO.FileAttributes]::ReparsePoint)
}
