Function Write-CmLogFile {
    <#
    .SYNOPSIS
        Write CMTrace formated messages to the log file
    .DESCRIPTION
        Appends a new line to the log file with the message provided in the parameters and formats the log entry in CMTrace readable format
    .PARAMETER LogFile
        Mandatory.  Specifies the path to the log file that will be updated.
    .PARAMETER Message
        Mandatory.  Specifies the string that will be written to the log file.
    .PARAMETER LogLevel
        Optional.  Specifies the severity level of the message, this defaults to Informational if not specified.
    .PARAMETER Clobber
        Optional.  Changes the default function to overwrite an existing file instead of appending to it.
    .EXAMPLE
        Write-CmLogFile -LogFile 'C:\Logs\MyLog.log' -Message "This is an informational message"

        Writes a informational message to a new line in the log file 'C:\Logs\MyLog.log'.
    .EXAMPLE
        Write-CmLogFile -LogFile $LogFile -Message "This is an error message" -LogLevel Error

        Writes an error message to a new line in the log file specified in the $LogFile variable.
    .EXAMPLE
        Write-CmLogFile -LogFile $LogFile -Message "This is an error message" -LogLevel Error -Clobber

        Writes an error message to a new file, overwritting any existing file specified in the $LogFile variable.
    .LINK
        https://cmlogger.readthedocs.io/en/latest/en-US/Write-CmLogFile
    .NOTES
        Author: Trent Willingham
        Check out my other scripts and projects @ https://github.com/twillin912
    #>

    #Requires -Version 3.0
    [CmdletBinding()]

    Param (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$LogFile,

        [Parameter(Mandatory=$true, Position=1,
            ValueFromPipeline)]
        [string]$Message,

        [Parameter()]
        [ValidateSet('Info','Warning','Error')]
        [string]$LogLevel,

        [Parameter()]
        [switch]$Clobber
    ) # /Param

    Begin {
        If ( $MyInvocation.ScriptName ) {
            $RunningContext = "$($MyInvocation.ScriptName | Split-Path -Leaf):$($MyInvocation.ScriptLineNumber)"
        }
        Else {
            $RunningContext = 'Console'
        }
        If ( -not ( $env:TimeZoneOffset ) ) {
            $env:TimeZoneOffset = (Get-CimInstance -ClassName "Win32_TimeZone").Bias
        }
    } # /Begin

    Process {
        Switch ( $LogLevel ) {
            "Info" { $Level = 1 }
            "Warning" { $Level = 2}
            "Error" { $Level = 3 }
            Default { $Level = 0 }
        } # /Switch

        $LogTime = "$(Get-Date -Format HH:mm:ss).$((Get-Date).Millisecond)$TimeZoneOffset"
        $Line = $Line = '<![LOG[{0}]LOG]!><time="{1}" date="{2}" component="{3}" context="" type="{4}" thread="{5}" file="">'
        $LineFormat = $Message, $LogTime, (Get-Date -Format MM-dd-yyyy), $RunningContext, $Level, $pid
        $Line = $Line -f $LineFormat
        If ( $Clobber ) {
            Set-Content -Value $Line -Path $LogFile -Encoding UTF8
        } else {
            Add-Content -Value $Line -Path $LogFile -Encoding UTF8
        }
    } # /Process
} # /Write-CmLogFile
