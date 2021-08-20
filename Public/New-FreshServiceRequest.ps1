function New-FreshServiceRequest {
    param (
	[Parameter(Mandatory = $true)]
	[object]$Body,
	[Parameter(Mandatory = $true)]
	[string]$ItemDisplayId
    )

    $Uri = "/catalog/request_items/$ItemDisplayId/service_request.json"
    $json = ConvertTo-Json $Body -Depth 3

    New-FreshRequest -Method Post -Resource $Uri -data $json
}
