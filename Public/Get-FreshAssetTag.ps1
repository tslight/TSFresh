function Get-FreshAssetTag {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory,ValueFromPipeline)]
	[object]$Ticket
    )

    process {
	$Notes = $Ticket.helpdesk_ticket.notes.note.body
	foreach ($Note in $Notes) {
	    if ($Note -match '^Dog Tag.*') {
		$Note -Replace "Dog Tag ",""
	    }
	}
    }
}
