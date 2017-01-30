---
external help file: CMLogger-help.xml
online version: https://cmlogger.readthedocs.io/en/latest/en-US/Write-CmLogFile
schema: 2.0.0
---

# Write-CmLogFile

## SYNOPSIS
Write CMTrace formated messages to the log file

## SYNTAX

```
Write-CmLogFile [-LogFile] <String> [-Message] <String> [-LogLevel <String>] [-Clobber]
```

## DESCRIPTION
Appends a new line to the log file with the message provided in the parameters and formats the log entry in CMTrace readable format

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Write-CmLogFile -LogFile 'C:\Logs\MyLog.log' -Message "This is an informational message"
```

Writes a informational message to a new line in the log file 'C:\Logs\MyLog.log'.

### -------------------------- EXAMPLE 2 --------------------------
```
Write-CmLogFile -LogFile $LogFile -Message "This is an error message" -LogLevel Error
```

Writes an error message to a new line in the log file specified in the $LogFile variable.

### -------------------------- EXAMPLE 3 --------------------------
```
Write-CmLogFile -LogFile $LogFile -Message "This is an error message" -LogLevel Error -Clobber
```

Writes an error message to a new file, overwritting any existing file specified in the $LogFile variable.

## PARAMETERS

### -LogFile
Mandatory. 
Specifies the path to the log file that will be updated.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Message
Mandatory. 
Specifies the string that will be written to the log file.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -LogLevel
Optional. 
Specifies the severity level of the message, this defaults to Informational if not specified.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Clobber
Optional. 
Changes the default function to overwrite an existing file instead of appending to it.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
Author: Trent Willingham
Check out my other scripts and projects @ https://github.com/twillin912

## RELATED LINKS

[https://cmlogger.readthedocs.io/en/latest/en-US/Write-CmLogFile](https://cmlogger.readthedocs.io/en/latest/en-US/Write-CmLogFile)

