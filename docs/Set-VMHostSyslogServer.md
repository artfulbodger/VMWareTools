---
external help file: VMWareTools-help.xml
Module Name: VMWareTools
online version:
schema: 2.0.0
---

# Set-VMHostSyslogServer

## SYNOPSIS
Configures Syslog settings for given VM Host.

This cmdlet configures the remote syslog server of the specified hosts.

## SYNTAX

```
Set-VMHostSyslogServer [-VMHost] <String> [-syslogcollector] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configures the Syslog collector host, and Syslog log levels for VM Host and enables Firewall exception for Syslog.

This cmdlet configures the remote syslog server of the specified hosts.

## EXAMPLES

### EXAMPLE 1
```
Set-VMHostSyslogServer -VMHost 192.168.0.1 -syslogcollector 192.168.0.200
```

Configures VM Host at IP address 192.168.0.1 to send 'Info' or greater syslog messages to Syslog collector at IP Address 192.168.0.200 using UDP port 514

### Example 1
```
Set-VMHostSysLogServer -SysLogServer '192.168.0.1:133' -VMHost Host
```

Sets a SysLog server on the Host virtual machine host.

### Example 2
```
Set-VMHostSysLogServer -SysLogServer $null -VMHost Host
```

Removes the SysLog server from the Host virtual machine host.

## PARAMETERS

### -VMHost
IP address or FQDN for VM Host.

Specifies the host whose syslog servers you want to configure.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -syslogcollector
IP address or FQDN for remote Syslog Collector.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Indicates that the cmdlet is run only to display the changes that would be made and actually no objects are modified.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
If the value is $true, indicates that the cmdlet asks for confirmation before running.
If the value is $false, the cmdlet runs without asking for user confirmation.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: $true
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### The modified NamedIPEndPoint object
## NOTES
This script currently assums that the Syslog collector is listening on UDP port 514.

## RELATED LINKS

[Online Version:](https://artfulbodger.github.io/VMWareTools/Set-VMHostSysLogServer.html)

