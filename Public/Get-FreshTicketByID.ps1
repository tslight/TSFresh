function Get-FreshTicketByID {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory,ValueFromPipeline)]
	[int[]]$TicketId
    )

    process {
	[string]$Method = "GET"
	[string]$Resource = "/helpdesk/tickets/" + $TicketId + ".json"
	try {
	    New-FreshRequest -Method $Method -Resource $Resource
	} catch {
	    Write-Warning $_
	}
    }
}
