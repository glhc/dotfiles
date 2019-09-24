# Loads PowerShell Profile

if (!(Test-Path -Path $PROFILE ))
	{Copy-Item ".\profile.ps1" -Destination $PROFILE}