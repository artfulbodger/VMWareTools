---
external help file: VMware.VimAutomation.ViCore.Cmdlets.dll-Help.xml
Module Name: VMware.VimAutomation.Core
online version:
schema: 2.0.0
---

# Set-VMHostSysLogServer

## SYNOPSIS
Configures Syslog settings for given VM Host.

This cmdlet configures the remote syslog server of the specified hosts.

## SYNTAX

```
Set-VMHostSysLogServer [[-SysLogServer] <NamedIPEndPoint[]>] [[-VMHost] <VMHost[]>] [-SysLogServerPort <Int32>]
 [-Server <VIServer[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
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

### -Server
Specifies the vCenter Server systems on which you want to run the cmdlet. If no value is given to this parameter, the command runs on the default servers. For more information about default servers, see the description of Connect-VIServer.

```yaml
Type: VIServer[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -SysLogServer
Specifies the sys log servers you want to configure. The parameter accepts objects of the NamedIPEndPoint, IPEndPoint, IPAddress, and String types. The accepted formats, if string is used, are DNS names and the standard IPv6/IPv4 format: FFFF:FFFF:FFFF:FFFF:FFFF:FFFF:192.168.0.1:80, where the FFFF:FFFF:FFFF:FFFF:FFFF:FFFF can be replaced by any hex value with the same structure (both upper or lower case). It is only meaningful in case of IPv6 address and is omitted for IPv4. The 192.168.0.1 part is mandatory and can be any address in the IPv4 format. The :80 part is optional. If omitted, the port must be specified through the SysLogServerPort parameter. If Syslog is set to $null, the configured syslog server, if any, is removed.

```yaml
Type: NamedIPEndPoint[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -SysLogServerPort
Specifies the sys log server port. Must be specified if the string that is passed to the SysLogServer parameter does not contain the port value, or the argument of the SysLogServer is an IP address.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VMHost
IP address or FQDN for VM Host.

Specifies the host whose syslog servers you want to configure.

```yaml
Type: VMHost[]
Parameter Sets: (All)
Aliases: Host

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: True
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### The modified NamedIPEndPoint object
## NOTES
This script currently assums that the Syslog collector is listening on UDP port 514.

## RELATED LINKS

[Online Version:](https://artfulbodger.github.io/VMWareTools/Set-VMHostSysLogServer.html)

