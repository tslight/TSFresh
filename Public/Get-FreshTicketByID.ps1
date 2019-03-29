function Get-FreshTicketByID {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory,ValueFromPipeline)]
	[int[]]$TicketId
    )

    process {
	$Method = "GET"
	$Resource = "/helpdesk/tickets/$TicketId.json"

	try {
	    New-FreshRequest -Method $Method -Resource $Resource
	} catch {
	    Write-Warning $_.InvocationInfo.ScriptName
	    Write-Warning $_.InvocationInfo.Line
	    Write-Warning $_.Exception.Message
	}
    }
}
