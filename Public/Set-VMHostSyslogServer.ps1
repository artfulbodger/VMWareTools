#Requires -Module VMware.VimAutomation.Core
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

      .EXAMPLE
      Set-VMHostSyslogServer -VMHost 192.168.0.1 -syslogcollector 192.168.0.200
      Configures VM Host at IP address 192.168.0.1 to send 'Info' or greater syslog messages to Syslog collector at IP Address 192.168.0.200 using UDP port 514

      .NOTES
      This script currently assums that the Syslog collector is listening on UDP port 514.

      .LINK
      URLs to related sites
      The first link is opened by Get-Help -Online Set-VMHostSyslogServer
  #>
  [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Medium')]
  Param
  (
    [Parameter(Mandatory,HelpMessage='IP Address for VMHost')][string]$VMHost,
    [Parameter(Mandatory,HelpMessage='IP Address for Syslog Collector')][string]$syslogcollector
  )

  Process
  {
    $creds = Get-credential -Message "Please provide credentials to connect to $VMHost"
    Connect-VIServer -Server $VMHost -Credential $creds -Force
    $vmhost = get-vmhost
    Get-AdvancedSetting -Entity $vmhost -Name Syslog.global.logHost | Set-AdvancedSetting -Value "udp://${syslogcollector}:514}"
    Get-AdvancedSetting -Entity $vmhost -Name Config.HostAgent.log.level | Set-AdvancedSetting -Value 'info'
    Get-AdvancedSetting -Entity $vmhost -Name Vpx.Vpxa.config.log.level | Set-AdvancedSetting -Value 'info'
    $vmhost| Get-VMHostFirewallException | Where-Object{$_.Name -eq 'syslog'} | Set-VMHostFirewallException -Enabled:$true
    Disconnect-VIServer
  }
}
