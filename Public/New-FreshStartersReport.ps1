function New-FreshStartersReport {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory)]
	[System.IO.FileInfo]$Path,
	[Parameter(Mandatory)]
	[int]$ViewId
    )

    $Path = "$Path\NewStarters"
    New-Path $Path -Type 'Directory'

    Write-Host "Getting all tickets from $ViewId..."
    $Tickets = Get-FreshTicketsByID $ViewId | New-FreshStarterObject
    $Years   = $Tickets.StartDate.SubString(0,4) | Sort-Object -Unique
    $Years   = $Years | New-YearsObject
    $Years   = $Tickets | Get-FreshStartersYears -Years $Years

    Export-Years -Years $Years -Path $Path
}
