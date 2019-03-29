function Get-FreshNoteString {
    <#
    .SYNOPSIS
    Find and remove a string from all notes in a ticket.

    .DESCRIPTION
    Searches all notes in ticket for a particular string and returns the
    contents of those tickets with the found string removed.

    .PARAMETER Ticket
    A Fresh ticket object
    #>
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
