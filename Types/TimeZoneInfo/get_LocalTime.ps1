<#
.SYNOPSIS
    Gets the local time
.DESCRIPTION
    Gets the local time for a timezone.
.EXAMPLE
    Get-TimeZone -ListAvailable
.EXAMPLE
    Get-TimeZone | Select LocalTime
#>
[DateTime]::UTCNow + $this.GetUtcOffset([DateTime]::UtcNow)