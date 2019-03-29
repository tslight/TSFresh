function Get-FreshServiceRequestDetails {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory)]
	[int]$RequestId
    )

    $Uri = "/catalog/items/$RequestId.json"
    # $Uri = "/api/v2/requesters/$RequestId"

    New-FreshRequest -Method Get -Resource $Uri
}
