# POWERSHELL FRESHSERVICE MODULE

Powershell module for interacting with Freshservice via their API.

Provides the following commands for

| **Cmdlet Name**          | **Params**   | **Param Description** | **Return Value**                                      |
|:-------------------------|:-------------|:----------------------|:------------------------------------------------------|
| `ConvertFrom-FreshDate`  | `-FreshDate` | *[string]*            | Convert from Fresh date format to AD friendly format  |
|                          | `-AD`        | *[switch]*            | User records whose name matches string                |
| `ConvertTo-FreshDate`    | `-Date`      | DateTime Object       | Date string that conforms to Fresh date formatting.   |
| `Export-FreshTicketYear` | `-Year`      | *[string]*            | Creates Xlsx       |
|                          | `-Status`    | Employment Status     | Filter by Employment Status too (defaults to Current) |
| `Get-SFUsersByStatus`    | `-Status`    | Employment Status     | Users with Employment Status (defaults to current)    |
|                          | `-New`       | *[switch]*            | Users also lacking email address (ie. New Starters)   |
| `Get-SFUsersByActive`    | `-Active`    | *[switch]*            | All active users (default)                            |
|                          | `-InActive`  | *[switch]*            | All inactive users                                    |
| `Get-SFSession`          | `-KeyFile`   | Encrypted API key     | Authenticated SalesForce Session                      |
| `Invoke-SFQuery`         | `-Query`     | SOQL statement        | Results of SOQL statement                             |
| `Update-SFUser`          | `-Id`        | User ID               | Updates an $Id with json from $Body                   |
|                          | `-Body`      | JSON to set field     |                                                       |
