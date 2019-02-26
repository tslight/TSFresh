function Get-FreshFailedStarterNotes {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory,ValueFromPipeline)]
	[object[]]$Note,
	[switch]$Html,
	[switch]$Text
    )

    begin {
	$Url = "$URL/helpdesk/tickets"
    }

    process {
	$DisplayId = $Note.display_id

	if ($Note.body -cmatch '.*FAILED.*|.*ABORTING.*') {
	    if ($Text) {
		$Failed = $Note.body
		$Failed += "$Url/$DisplayId"
	    } elseif ($Html) {
		$Failed  = $Note.body_html
		$Failed += "<br>$Url/$DisplayId<br><br><br>"
	    } else {
		$Failed  = $Note
	    }
	    Write-Output $Failed
	} else {
	    Write-Debug "Can't find failed string in $($Note.id) $Url/$DisplayId."
	}
    }
}
