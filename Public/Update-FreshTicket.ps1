function Update-FreshTicket {
    param (
	[Parameter(Mandatory = $true, Position = 0)]
	[Int32]$TicketID
    )

    $json = "[
	{
	    ""requested_item"": {
		""item_display_id"": 25,
		""catalog_item"": ""New Starter"",
		""stage_name"": ""Requested"",
		""requested_item_values"": {
		    ""Additional information"": null,
		    ""Please confirm server and folder access, or anything else"": ""NA"",
		    ""What specialist software do you need (if any)"": ""NA"",
		    ""If NO, what is the Asset Tag and where is the machine"": null,
		    ""If Yes, you will need to order a machine, please fill in the new computer form"": null,
		    ""Model"": ""Apple MacBook Pro 15-inch"",
		    ""Options"": ""Apple Mac"",
		    ""Do you need a new Machine?"": ""Yes"",
		    ""Contract end date"": null,
		    ""Replacement / New Position"": ""New Position"",
		    ""Permanent  / Temp"": ""Permanent"",
		    ""Telephone extension required (yes or no)"": ""no"",
		    ""Floor/Office"": ""IT"",
		    ""Line Manager"": ""Georgios"",
		    ""Sub Department"": null,
		    ""Location"": ""London"",
		    ""Department"": ""IT"",
		    ""Start date"": ""2018-11-07T12:45:00+00:00"",
		    ""Job title"": ""Testing"",
		    ""Surname"": ""TobyTesting"",
		    ""First name"": ""TobyTesting"",
		    ""Title"": ""Mr""
		},
		""item_type"": 1,
		""location_id"": null,
		""to_date"": null,
		""from_date"": null,
		""remarks"": null,
		""updated_at"": ""2018-11-06T12:50:35+00:00"",
		""created_at"": ""2018-11-06T12:50:35+00:00"",
		""quantity"": 1,
		""service_request_id"": 25004618470,
		""id"": 25000306744
	    }
	}
    ]"
    $Method = "POST"
    $Resource = "/helpdesk/tickets/$TicketID/requested_items.json"
    New-FreshRequest -Method $Method -Resource $Uri -data $json
}
