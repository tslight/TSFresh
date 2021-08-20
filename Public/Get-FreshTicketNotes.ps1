function Get-FreshTicketNotes {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory,ValueFromPipeline)]
	[object[]]$Ticket,
	[switch]$ShowDeleted
    )

    process {
	$DisplayId = $Ticket.display_id
	$HelpDesk  = ($DisplayId | Get-FreshTicketByID).helpdesk_ticket
	$Note      = $HelpDesk.notes.note
	$Note | Add-Member -MemberType NoteProperty -Name display_id -Value $DisplayId
	if ($ShowDeleted) {
	    Write-Output $Note
	} else {
	    Write-Output $Note | ? { $_.deleted -eq $False}
	}
    }
}
