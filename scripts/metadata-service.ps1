function Get-MetaDataService {
    [CmdletBinding()]
    param (
        [string]$metadataApi,
        [string]$resource,
        [string]$data,
        [string]$apiVersion
    )

    # Set metadata service IP
    $ImdsServer = "169.254.169.254"

    # Build up endpoint string
    $InstanceEndpoint = $ImdsServer + "/metadata/" + $metadataApi

    # Build up URI string and replace double forward slashes with single
    $uri = $InstanceEndpoint + "/" + $resource + "/" + $data + "?api-version=$apiVersion" -replace '/+', '/' 

    # Build full uri by adding the protocol
    $fullUri = "http://" + $uri

    # Call API and pull back result into an object. 
    $result = Invoke-RestMethod -Method GET -Uri $fullUri -Headers @{"Metadata" = "True" }

    # Output result as JSON
    $result | ConvertTo-JSON -Depth 99
}

# Examples of using this function

Get-MetaDataService -metadataApi "instance" -apiVersion "2019-06-04"
Get-MetaDataService -metadataApi "instance" -resource "network" -apiVersion "2019-06-04"
Get-MetaDataService -metadataApi "instance" -resource "compute" -apiVersion "2019-06-04"

# I couldn't quite get it to work when passing in a particular data key, This is what I was trying to achieve

Get-MetaDataService -metadataApi "instance" -resource "compute" -data "osSize" -apiVersion "2019-06-04"
