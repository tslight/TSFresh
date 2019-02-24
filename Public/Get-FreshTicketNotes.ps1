function Get-FreshTicketNotes {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory,ValueFromPipeline)]
	[object[]]$Ticket
    )

    process {
	$DisplayId = $Ticket.display_id
	$HelpDesk  = ($DisplayId | Get-FreshTicketByID).helpdesk_ticket
	$Note      = $HelpDesk.notes.note
	$Note | Add-Member -MemberType NoteProperty -Name display_id -Value $DisplayId
	Write-Output $Note
    }
}
