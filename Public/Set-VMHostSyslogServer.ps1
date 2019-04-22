#Requires -Version 3.0
#Requires -Modules @{ ModuleName="VMware.VimAutomation.Core"; ModuleVersion="11.2.0.12483638" }
function Set-VMHostSyslogServer
{
  <#
      .SYNOPSIS
      Configures Syslog settings for given VM Host.

      .DESCRIPTION
      Configures the Syslog collector host, and Syslog log levels for VM Host and enables Firewall exception for Syslog.

      .PARAMETER VMHost
      IP address or FQDN for VM Host.

      .PARAMETER syslogcollector
      IP address or FQDN for remote Syslog Collector.

      .PARAMETER syslogport
      Listening IP port used for syslog on Collector

      .EXAMPLE
      Set-VMHostSyslogServer -VMHost 192.168.0.1 -syslogcollector 192.168.0.200 -syslogport 514
      Configures VM Host at IP address 192.168.0.1 to send 'Info' or greater syslog messages to Syslog collector at IP Address 192.168.0.200 using UDP port 514

      .NOTES
      This script currently assumes that the Syslog collector is listening on a UDP port.

      .LINK
      https://artfulbodger.github.io/VMWareTools/Set-VMHostSyslogServer
  #>
  [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Medium')]
  Param
  (
    [Parameter(Mandatory,HelpMessage='IP Address for VMHost')][string]$VMHost,
    [Parameter(Mandatory,HelpMessage='IP Address for Syslog Collector')][string]$syslogcollector,
    [ValidateRange(1,65535)][uint16]$syslogport=514
  )

  Process
  {
    $creds = Get-credential -Message "Please provide credentials to connect to $VMHost"
    Connect-VIServer -Server $VMHost -Credential $creds -Force
    $vmhost = get-vmhost
    Get-AdvancedSetting -Entity $vmhost -Name Syslog.global.logHost | Set-AdvancedSetting -Value "udp://${syslogcollector}:${syslogport}}"
    Get-AdvancedSetting -Entity $vmhost -Name Config.HostAgent.log.level | Set-AdvancedSetting -Value 'info'
    Get-AdvancedSetting -Entity $vmhost -Name Vpx.Vpxa.config.log.level | Set-AdvancedSetting -Value 'info'
    $vmhost| Get-VMHostFirewallException | Where-Object{$_.Name -eq 'syslog'} | Set-VMHostFirewallException -Enabled:$true
    Disconnect-VIServer
  }
}
