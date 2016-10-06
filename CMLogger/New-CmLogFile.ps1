Function New-CmLogFile
{
	<#
	.SYNOPSIS
		Creates a new log file
	.DESCRIPTION
		Creates a log file in the location specified in the parameters.  Appends to existing file or creates a new file if one does not exist
	.PARAMETER FilePath
		Manadotry. Full path of the log file to be created or appended.  Example: C:\Windows\Temp\MyLog.log
	.INPUTS
		Parameters above
	.OUTPUTS
		None
	.NOTES
        Author: Trent Willingham
        Check out my other scripts and projects @ https://github.com/twillin912

        Change Log
        v1.00   2016-06-01   Initial Release
	.EXAMPLE
		New-CmLogFile -FilePath "C:\Windows\Temp\MyLog.log"
	#>
	[CmdletBinding()]
	Param
	(
		[Parameter(Mandatory=$true,Position=0)]
		[string]$FilePath
	)

	Process
	{
		Try
		{
			If ( ! ( Test-Path -Path $( Split-Path -Path $FilePath -Parent ) ) )
			{

				New-Item $( Split-Path -Path $FilePath -Parent ) -ItemType Directory | Out-Null
				New-Item $FilePath -ItemType File | Out-Null
			} ElseIf ( ! ( Test-Path -Path $FilePath ) )
			{
				#Create log file if it does not exist
				New-Item $FilePath -ItemType File | Out-Null
			}
			$Global:ScriptLogFilePath = $FilePath
			$Global:ScriptLogTimeZone = (Get-WmiObject -Query "SELECT Bias FROM Win32_TimeZone").Bias
		}
		Catch
		{
			Write-Error $_.Exception.Message
		}
	} #Process

} #End Function New-CmLogFile

