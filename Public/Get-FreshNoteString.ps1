function Get-FreshNoteString {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory,ValueFromPipeline)]
	[object]$Ticket,
	[Parameter(Mandatory)]
	[string]$String
    )

    process {
	$Notes = $Ticket.helpdesk_ticket.notes.note.body
	foreach ($Note in $Notes) {
	    if ($Note -match "^$String.*") {
		$Note -Replace "$String ",""
	    }
	}
    }
}
