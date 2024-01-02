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
