Function Write-CmLogFile
{
	<#
	.SYNOPSIS
		Write CMTrace formated messages to the log file
	.DESCRIPTION
		Appends a new line to the log file with the message provided in the parameters and formats the log entry in CMTrace readable format
	.PARAMETER Message
		Mandatory.  The string that you want to write to the log file
	.PARAMETER LogLevel
		Optional.  The severity level of the message, this defaults to Informational if not specified
	.INPUTS
		Parameters above
	.OUTPUTS
		None
	.NOTES
		Author:         Trent Willingham
		Version:        1.0.0
		Last Updated:   06/01/2016
	.EXAMPLE
		Write-CmLogFile -Message "This is an informational message"

		Writes a informational message to a new line in the log file.
	.EXAMPLE
		Write-CmLogFile -Message "This is an error message" -LogLevel Error

		Writes an error message to a new line in the log file.
	#>
	[CmdletBinding()]
	Param
	(
		[Parameter(Mandatory=$true)]
		[string]$Message,

		[Parameter()]
		[ValidateSet('Info','Warning','Error')]
		[string]$LogLevel
	)

	Process
	{
		Switch ( $LogLevel )
		{
			"Info" { $Level = 1 }
			"Warning" { $Level = 2}
			"Error" { $Level = 3 }
			Default { $Level = 0 }
		}

		$LogTime = "$(Get-Date -Format HH:mm:ss).$((Get-Date).Millisecond)$ScriptLogTimeZone"
		$Line = $Line = '<![LOG[{0}]LOG]!><time="{1}" date="{2}" component="{3}" context="" type="{4}" thread="{5}" file="">'
		$LineFormat = $Message, $LogTime, (Get-Date -Format MM-dd-yyyy), "$($MyInvocation.ScriptName | Split-Path -Leaf):$($MyInvocation.ScriptLineNumber)", $Level, $pid
		$Line = $Line -f $LineFormat
		Add-Content -Value $Line -Path $ScriptLogFilePath -Encoding UTF8
	}
}
