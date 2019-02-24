function New-FreshNewStarterTicket {
    param (
	[string]$FullName
    )

    $json = "{
	""helpdesk_ticket"":{
	    ""custom_field"": {
		""category_28834"": ""Starters and Leavers"",
		""untitled_28834"": ""I.T. Department"",
		""sub_category_28834"": ""New Starter""
	    },
	    ""description"": ""New Starter request from SalesForce."",
	    ""subject"":""Request for $FullName : New Starter"",
	    ""email"":""$EmailAddress"",
	    ""priority"":1, ""status"":2, ""source"":2,""ticket_type"":""Service Request""
	},
	""cc_emails"":""""
    }"

    New-FreshTicket -json $json
}
